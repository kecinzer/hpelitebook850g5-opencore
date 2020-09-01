/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLYH0BPS.aml, Tue Sep  1 10:19:03 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000246 (582)
 *     Revision         0x02
 *     Checksum         0x28
 *     OEM ID           "ACDT"
 *     OEM Table ID     "CPD0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "CPD0", 0x00000000)
{
    External (_SB_.GNUM, MethodObj)    // 1 Arguments
    External (_SB_.INUM, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.I2C1.CPD0, DeviceObj)
    External (_SB_.PCI0.I2C1.CPD0.BADR, IntObj)
    External (_SB_.PCI0.I2C1.CPD0.HID2, IntObj)
    External (_SB_.PCI0.I2C1.CPD0.INT1, IntObj)
    External (_SB_.PCI0.I2C1.CPD0.INT2, IntObj)
    External (_SB_.PCI0.I2C1.CPD0.SBFB, IntObj)
    External (_SB_.PCI0.I2C1.CPD0.SBFG, IntObj)
    External (_SB_.PCI0.I2C1.CPD0.SBFI, IntObj)
    External (_SB_.PCI0.I2C1.CPD0.SPED, IntObj)
    External (_SB_.SHPO, MethodObj)    // 2 Arguments
    External (_SB_.SRXO, MethodObj)    // 2 Arguments
    External (GPDI, FieldUnitObj)
    External (OSYS, FieldUnitObj)
    External (SBFI, IntObj)
    External (SDM1, FieldUnitObj)

    Scope (_SB.PCI0.I2C1.CPD0)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin")){}
            ElseIf ((OSYS < 0x07DC))
            {
                SRXO (GPDI, One)
            }

            INT1 = GNUM (GPDI)
            INT2 = INUM (GPDI)
            If (_OSI ("Darwin"))
            {
                SHPO (GPDI, One)
            }
            ElseIf ((SDM1 == Zero))
            {
                SHPO (GPDI, One)
            }

            HID2 = 0x20
            BADR = 0x2C
            SPED = 0x00061A80
        }

        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            If (_OSI ("Darwin"))
            {
                Return (ConcatenateResTemplate (SBFB, SBFG))
            }
            Else
            {
                If ((OSYS < 0x07DC))
                {
                    Return (SBFI) /* External reference */
                }

                If ((SDM1 == Zero))
                {
                    Return (ConcatenateResTemplate (SBFB, SBFG))
                }

                Return (ConcatenateResTemplate (SBFB, SBFI))
            }
        }
    }
}

