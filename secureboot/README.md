# OpenCore UEFI Secure Boot GUIDE

To accomplish secure UEFI we need to sign our OpenCore files with own certifcate that will be imported into BIOS and then compared during boot process. I found nice guide in [OpenCore Configuration](https://dortania.github.io/docs/latest/Configuration.html#x1-820002).\
For signing process there are some special tools that is needed (like *sbsign*). There is ZIP file attached to this guide. I recommand to put it on place that is in your PATH and can be run from anywhere.\
Unfortunately there are 2 commands that is not supported in macOS (cert-to-efi-sig-list and sign-efi-sig-list). I solved this by installing efitools on my RaspberryPI and use it on it.\
**I highly recommend to try this procedure firstly on USB flash disk and when everything is working, than on live EFI on disk**.\
Before we start, there are some prerequisites.

1. Set **SecureBootModel** in config.plist. In my case I set it to "j213".
2. Set **DmgLoading** in config.plist to "Disabled" or "Signed".
3. Make sure that APFS JumpStart functionality restricts the loading of old vulnerable drivers by setting "MinDate" and "MinVersion" to 0 in config.plist.
4. Make sure that Force driver loading is not needed and all the operating systems are still bootable.
5. Make sure that **ScanPolicy** restricts loading from undesired devices in config.plist. I set it to "19857667".

It's also good idea to set Apple Secure Boot to "Full Security". It can be done by set **ApECID** in config.plist and then make change in Recovery (for existing installation). There is great [Dortania guide](https://dortania.github.io/OpenCore-Post-Install/universal/security/applesecureboot.html#apecid) for it.

## Create own certificates

We will create certificates with 10 years of validity. We also need to create more types of this keys, specialy binary ones and convert it to EFI usable format. I get this from another guide. Let's say that we create folder for keys and we will use it. I will call it "/path-to-stored-keys".
```sh
mkdir /path-to-stored-keys
cd /path-to-stored-keys

openssl req -new -x509 -newkey rsa:2048 -subj "/CN=mycert PK/" -keyout PK.key -out PK.crt -days 3650 -nodes -sha256
openssl req -new -x509 -newkey rsa:2048 -subj "/CN=mycert KEK/" -keyout KEK.key -out KEK.crt -days 3650 -nodes -sha256
openssl req -new -x509 -newkey rsa:2048 -subj "/CN=mycert DB/" -keyout DB.key -out DB.crt -days 3650 -nodes -sha256

openssl x509 -in PK.crt -out PK.cer -outform DER
openssl x509 -in KEK.crt -out KEK.cer -outform DER
openssl x509 -in DB.crt -out DB.cer -outform DER

GUID=`python -c 'import uuid; print(str(uuid.uuid1()))'`
echo $GUID > guid.txt

cert-to-efi-sig-list -g $GUID PK.crt PK.esl
cert-to-efi-sig-list -g $GUID KEK.crt KEK.esl
cert-to-efi-sig-list -g $GUID DB.crt DB.esl

sign-efi-sig-list -t "$(date --date='1 second' +'%Y-%m-%d %H:%M:%S')" -k PK.key -c PK.crt PK PK.esl PK.auth
sign-efi-sig-list -t "$(date --date='1 second' +'%Y-%m-%d %H:%M:%S')" -k PK.key -c PK.crt KEK KEK.esl KEK.auth
sign-efi-sig-list -t "$(date --date='1 second' +'%Y-%m-%d %H:%M:%S')" -k KEK.key -c KEK.crt db DB.esl DB.auth
```
Now we have all needed files. For proper authorization from BIOS we need to import public keys.\
Copy \*.cer, \*.esl, \*.auth (where \* is PK, PEK and DB) into USB FAT32 drive (/path-to-usbdrive/).
```sh
cd /path-to-stored-keys
cp *.cer *.esl *.auth /path-to-usbdrive/
```
I tried to import this files with HP BIOS itself, but without success. Then I found KeyTool.efi that can do this.

## Prepare OpenCore bootloader

Before we import our keys into BIOS, we need to prepare our OpenCore EFI partition. We need to sign some files and we also create Vault.\

### Sign drivers and tools

We need to sign all drivers and tools in OC folder. I have only 2 drivers and 2 tools.

```sh
cd /path-to-efi/EFI/OC
cd Drivers
sbsign --key /path-to-stored-keys/DB.key --cert /path-to-stored-keys/DB.crt --output HfsPlus.efi HfsPlus.efi
sbsign --key /path-to-stored-keys/DB.key --cert /path-to-stored-keys/DB.crt --output OpenRuntime.efi OpenRuntime.efi
cd ../Tools
sbsign --key /path-to-stored-keys/DB.key --cert /path-to-stored-keys/DB.crt --output CleanNvram.efi CleanNvram.efi
sbsign --key /path-to-stored-keys/DB.key --cert /path-to-stored-keys/DB.crt --output OpenShell.efi OpenShell.efi
```

### Create Vault

According to this [Dortania guide](https://dortania.github.io/OpenCore-Post-Install/universal/security/vault.html).\
We need to change **Vault** in config.plist to "Secure". And then vault OpenCore folder.

```sh
cd /path-to-efi/EFI/OC
create_vault.sh .
RsaTool -sign vault.plist vault.sig vault.pub

off=$(($(strings -a -t d OpenCore.efi | grep "=BEGIN OC VAULT=" | cut -f1 -d' ')+16))
dd of=OpenCore.efi if=vault.pub bs=1 seek=$off count=528 conv=notrunc
rm vault.pub
```
With created vault we can't change anything in config.plist or add/delete files. If we do that, OpenCore won't boot because found changed files. So we need to create vault every time we change anything. If we want to disable vault, we can't only change **Vault** option in config.plist, but we also need to replace OpenCore.efi!

This step is optional but highly recomended, because without it, there is no reason for doing all this procedure.

### Sign rest of boot files

Now we have signed drivers and tools plus created vault. It's time to sign rest of needed files.

```sh
cd /path-to-efi/EFI/OC
sbsign --key /path-to-stored-keys/DB.key --cert /path-to-stored-keys/DB.crt --output OpenCore.efi OpenCore.efi
cd Bootstrap
sbsign --key /path-to-stored-keys/DB.key --cert /path-to-stored-keys/DB.crt --output Bootstrap.efi Bootstrap.efi
cd ../../BOOT
sbsign --key /path-to-stored-keys/DB.key --cert /path-to-stored-keys/DB.crt --output BOOTx64.efi BOOTx64.efi
```

As you can see, we signed OpenCore.efi. So if someone would like to change our configuration they can't do it because they don't have our private sign key to sign OpenCore.efi after change configuration and vaulting.

### Test boot with signed files

We need to test, that new configuration can boot. If so, we can continue with import our keys to BIOS and enable Secure boot.

## Import our keys to BIOS

At the beginning I removed all old stored keys. It can be done in BIOS, Advanced, Secure Boot Configuration and check "Clear Secure Boot Keys". Then exist and save configuration.\
For import keys we use KeyTool.efi bootloader. I discovered, that BIOS automatically turn on Secure boot after import of new keys, that why we already prepared our EFI. It's also good idea to sign KeyTools.efi.
```sh
cd /path-to-usbdrive
sbsign --key /path-to-stored-keys/DB.key --cert /path-to-stored-keys/DB.crt --output KeyTool.efi KeyTool.efi
```

For start KeyTool.efi we need to go to BIOS start menu and choose this file in USB flash disk. Blue screen appears with 4 menus as you can see at [this guide](http://www.rodsbooks.com/efi-bootloaders/controlling-sb.html#keytool). I went to "Edit Keys" and imported all 3 files with auth endings. Then I saved it.

If everything went right we have enabled Secure Boot and we can boot to OpenCore.

For finish our secure configuration it's very good idea to set BIOS password. So no one can disable secure boot.