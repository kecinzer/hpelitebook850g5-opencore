DefinitionBlock ("", "SSDT", 2, "hack", "_CPD0", 0x00000000)
{
    External (_SB_.PCI0.I2C1.CPD0, DeviceObj)

    Scope (_SB.PCI0.I2C1.CPD0)
    {
        If (_OSI ("Darwin"))
        {
            Name (OSYS, 0x07DC)
        }
    }
}