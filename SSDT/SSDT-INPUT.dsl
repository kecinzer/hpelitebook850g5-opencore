DefinitionBlock("", "SSDT", 2, "hack", "INPUT", 0)
{
	External(\_SB.PCI0.LPCB.PS2K, DeviceObj)
    Scope (\_SB.PCI0.LPCB.PS2K)
    {
        Name(RMCF, Package()
        {
        "Keyboard", Package()
        {
            "Custom ADB Map", Package()
            {
                "Swap command and option", ">y",
                Package(){},
                //"e03e=83",    // F1 (display) to Launchpad - this not working and I don't know why, so I disabled it.
                "e001=34",    // F8 (microphone) to Play/Pause
                //"e078=a0",    // F11 (wifi) to Mission Control - this not working and I don't know why, so I disabled it.
                "e01d=3d"     // Right Control to Right Alt
            }
        }
        })
    }
}