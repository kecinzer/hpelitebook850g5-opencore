# HP EliteBook 850 G5 Hackintosh
Latest Opencore for HP EliteBook 850 G5.
For my specific laptop configuration almost everything works except SmartCard reader, that I even don't use.
I'm still working on improvement and clean ups.

Huge thanks to [Acidanthera team](https://github.com/acidanthera) for [OpenCore](https://github.com/acidanthera/OpenCorePkg).
Extra credit goes to @usr-sse2 for [help with battery](https://github.com/acidanthera/bugtracker/issues/892).
Also specialy thanks to @RehabMan because it's based on [his work](https://github.com/RehabMan/HP-ProBook-4x30s-DSDT-Patch/tree/i2c).

### Currently not working

- Trackpoint with buttons (that point in center of G, H, B keys), but we have great touchpad with all gertures.
- Hibernation (I think it can be done somehow, but I don't need it and I use FileVault2 full disk encryption).
- DRM (Apple TV+, Netflix in Safari), but there is workaround use different browser ([Vivaldi](https://vivaldi.com) for me). There is also web version of [Apple TV+](https://tv.apple.com) that works from browser.
- Dual display port output on HP Ultraslim dock 2013 and other docking stations. Both DP works as one because macOS [doesn't support DisplayPort MST (Multi Stream or daisy-chaining)](https://medium.com/@sebvance/everything-you-need-to-know-about-macbook-pros-and-their-lack-of-displayport-mst-multi-stream-98ce33d64af4). It's not issue with Hackintosh but macOS itself.

## BIOS settings

This is my BIOS settings (it's little bit outdated as I now using BIOS 01.10.01 Rev.A). With it works even USB-C/Thunderbolt port with hotplug.

![](pictures/bios_01.jpeg)
![](pictures/bios_02.jpeg)
![](pictures/bios_03.jpeg)
![](pictures/bios_04.jpeg)
![](pictures/bios_05.jpeg)
![](pictures/bios_06.jpeg)
![](pictures/bios_07.jpeg)
![](pictures/bios_08.jpeg)
![](pictures/bios_09.jpeg)
![](pictures/bios_10.jpeg)

My WiFi card that is supported Out of the Box in macOS 10.15.

![](pictures/wifi.jpeg)