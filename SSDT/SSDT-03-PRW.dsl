DefinitionBlock("", "SSDT", 2, "hack", "PRW", 0)
{
    // In DSDT, native GPRW is renamed to XPRW with Clover binpatch.
    // (or UPRW to XPRW)
    // As a result, calls to GPRW (or UPRW) land here.
    // The purpose of this implementation is to avoid "instant wake"
    // by returning 0 in the second position (sleep state supported)
    // of the return package.
    External(XPRW, MethodObj)
    Method(GPRW, 2)
    {
        If (0x6d == Arg0) { Return (Package() { 0x6d, 0, }) }
        If (0x0d == Arg0) { Return (Package() { 0x0d, 0, }) }
        Return (XPRW(Arg0, Arg1))
    }
    Method(UPRW, 2)
    {
        If (0x6d == Arg0) { Return (Package() { 0x6d, 0, }) }
        If (0x0d == Arg0) { Return (Package() { 0x0d, 0, }) }
        Return (XPRW(Arg0, Arg1))
    }

    // In DSDT, native LANC._PRW is renamed XPRW with Clover binpatch.
    // As a result, calls to LANC._PRW land here.
    // The purpose of this implementation is to avoid "instant wake"
    // by returning 0 in the second position (sleep state supported)
    // of the return package.
    // LANC._PRW is renamed to XPRW so we can replace it here
    External(_SB.PCI0.LANC, DeviceObj)
    External(_SB.PCI0.LANC.XPRW, MethodObj)
    Method(_SB.PCI0.LANC._PRW)
    {
        Local0 = \_SB.PCI0.LANC.XPRW()
        Local0[1] = 0
        Return(Local0)
    }
}