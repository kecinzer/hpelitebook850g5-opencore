Forked from https://github.com/kecinzer/hpelitebook850g5-opencore
Using on a Elitebook 830 g5 with touchscreen, with fenvi BCM94360NG wifi card, 256gb NVME ssd, 8350u CPU, with working smart card reader.
Differences from kecinzer build:
- Additional IRQ conflict fixes (prevents problems) - not obligatory;
- Aditional .aml file for touchscreen (SSDT-TPL0.aml file and active on config.plist);
- Device Properties with fix for HDMI and USB-C video output, as well as audio spoof;
- USB mapping;
- Opencanopy for better GUI on boot selection.

And that's it ;) The rest please go see on the original github.
