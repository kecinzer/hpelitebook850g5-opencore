DefinitionBlock("", "SSDT", 2, "hack", "AUDIO", 0)
{
    #define LAYOUTID 3

    // inject properties for audio

    External(_SB.PCI0.HDEF, DeviceObj)
    Method(_SB.PCI0.HDEF._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return(Package()
        {
            "layout-id", Buffer(4) { LAYOUTID, 0, 0, 0 },
            "hda-gfx", Buffer() { "onboard-1" },
            "PinConfigurations", Buffer() { },
            "RM,disable_FakePCIID", 1,  //SKL spoof: remove or set zero
        })
    }

    // Disable native HECI (Intel MEI) identity by injecting _STA=0

    External(_SB.PCI0.HECI, DeviceObj)
    Name(_SB.PCI0.HECI._STA, 0)
}