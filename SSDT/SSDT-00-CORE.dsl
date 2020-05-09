DefinitionBlock("", "SSDT", 2, "hack", "HACK", 0)
{
    External(_SB.PCI0.RP05.PXSX, DeviceObj)
    External(_SB.PCI0.RP05.PXSX.XDSS, MethodObj)
    External(_SB.PCI0.LPCB.EC.ECRG, IntObj)

    Scope(_SB.PCI0.RP05.PXSX)
    {
        // original RDSS is renamed to XDSS
        // the original RDSS does not check for EC "ready" state
        Method(RDSS, 1)
        {
            // check if EC is ready and XDSS exists
            If (\_SB.PCI0.LPCB.EC.ECRG && CondRefOf(^XDSS))
            {
                // call original RDSS (now renamed XDSS)
                XDSS(Arg0)
            }
        }
    }

    External(\_SB.PCI0, DeviceObj)

//
// Simulate Windows for _OSI calls
//
    // All _OSI calls in DSDT are routed to XOSI...
    // XOSI simulates "Windows 2009" (which is Windows 7)
    // Note: According to ACPI spec, _OSI("Windows") must also return true
    //  Also, it should return true for all previous versions of Windows.
    Method(XOSI, 1)
    {
        // simulation targets
        // source: (google 'Microsoft Windows _OSI')
        //  http://download.microsoft.com/download/7/E/7/7E7662CF-CBEA-470B-A97E-CE7CE0D98DC2/WinACPI_OSI.docx
        Local0 = Package()
        {
            "Windows",              // generic Windows query
            "Windows 2001",         // Windows XP
            "Windows 2001 SP2",     // Windows XP SP2
            "Windows 2006",         // Windows Vista
            "Windows 2006 SP1",     // Windows Vista SP1
            "Windows 2006.1",       // Windows Server 2008
            "Windows 2009",         // Windows 7/Windows Server 2008 R2
            "Windows 2012",         // Windows 8/Windows Server 2012
            "Windows 2013",         // Windows 8.1/Windows Server 2012 R2
            "Windows 2015",         // Windows 10/Windows Server TP
        }
        Return (Ones != Match(Local0, MEQ, Arg0, MTR, 0, 0))
    }

//
// DGPU disable (and related shutdown fix)
//
    // In DSDT, native _PTS and _WAK are renamed ZPTS/ZWAK
    // As a result, calls to these methods land here.
    Method(_PTS, 1)
    {
        // Disable XHC PMEE if XPEE is specified 1
        // This fixes "auto restart after shutdown" with USB devices connected
        If (5 == Arg0)
        {
            External(\_SB.PCI0.XHC.PMEE, FieldUnitObj)
            If (CondRefOf(\_SB.PCI0.XHC.PMEE)) { \_SB.PCI0.XHC.PMEE = 0 }
        }
        External(\ZPTS, MethodObj)
        ZPTS(Arg0)
    }
    Method(_WAK, 1)
    {
        If (Arg0 < 1 || Arg0 > 5) { Arg0 = 3 }
        External(\ZWAK, MethodObj)
        Local0 = ZWAK(Arg0)
        Return(Local0)
    }

    External(_SB.PCI0.LPCB.EC, DeviceObj)
    External(_SB.PCI0.LPCB.EC.XREG, MethodObj)

    // original _REG is renamed to XREG
    Scope(_SB.PCI0.LPCB.EC)
    {
        OperationRegion(ECR3, EmbeddedControl, 0x00, 0xFF)
        Method(_REG, 2)
        {
            // call original _REG (now renamed XREG)
            XREG(Arg0, Arg1)
        }
    }

//
// Add SMBUS device
// From SSDT-SMBUS.dsl
//
    External (_SB_.PCI0.SBUS.BUS0, DeviceObj)
    Device(_SB.PCI0.SBUS.BUS0)
    {
        Name(_CID, "smbus")
        Name(_ADR, Zero)
        Device(DVL0)
        {
            Name(_ADR, 0x57)
            Name(_CID, "diagsvault")
            Method(_DSM, 4)
            {
                If (!Arg2) { Return (Buffer() { 0x03 } ) }
                Return (Package() { "address", 0x57 })
            }
        }
    }

//
// Unsupported LPC devices
// From SSDT-LPC.dsl
//
    External(_SB.PCI0.LPCB, DeviceObj)
    Scope(_SB.PCI0.LPCB)
    {
        OperationRegion(RMP2, PCI_Config, 2, 2)
        Field(RMP2, AnyAcc, NoLock, Preserve)
        {
            LDID,16
        }
        Name(LPDL, Package()
        {
            // list of 8-series LPC device-ids not natively supported
            // inject 0x8c4b for unsupported LPC device-id
            0x8c46, 0x8c49, 0x8c4a, 0x8c4c, 0x8c4e, 0x8c4f,
            0x8c50, 0x8c52, 0x8c54, 0x8c56, 0x8c5c, 0,
            Package()
            {
                "device-id", Buffer() { 0x4b, 0x8c, 0, 0 },
                "compatible", Buffer() { "pci8086,8c4b" },
            },
        })
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            // search for matching device-id in device-id list, LPDL
            Local0 = Match(LPDL, MEQ, LDID, MTR, 0, 0)
            If (Ones != Local0)
            {
                // start search for zero-terminator (prefix to injection package)
                Local0 = Match(LPDL, MEQ, 0, MTR, 0, Local0+1)
                Return (DerefOf(LPDL[Local0+1]))
            }
            // if no match, assume it is supported natively... no inject
            Return (Package() { })
        }
    }

//
// Deal with "instant wake" via _PRW override
// From SSDT-PRW.dsl, SSDT-LANC_PRW.dsl
//

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