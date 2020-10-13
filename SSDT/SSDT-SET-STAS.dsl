/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL4hp8NM.aml, Tue Oct 13 14:10:43 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000050 (80)
 *     Revision         0x01
 *     Checksum         0x15
 *     OEM ID           "HACK"
 *     OEM Table ID     "SET-STAS"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 1, "HACK", "SET-STAS", 0x00000000)
{
    External (STAS, IntObj)

    Scope (_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                STAS = One
            }
        }
    }
}

