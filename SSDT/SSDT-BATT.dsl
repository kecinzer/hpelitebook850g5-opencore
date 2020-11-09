/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL1L7cuk.aml, Mon Nov  9 21:43:34 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000014F8 (5368)
 *     Revision         0x02
 *     Checksum         0x21
 *     OEM ID           "hack"
 *     OEM Table ID     "BATT"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "BATT", 0x00000000)
{
    External (_SB_.BAT0, DeviceObj)
    External (_SB_.BAT1, DeviceObj)
    External (_SB_.NBST, PkgObj)
    External (_SB_.NBTE, PkgObj)
    External (_SB_.NBTI, PkgObj)
    External (_SB_.NDBS, PkgObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.BATN, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.BATP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.BRCC, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.BRCV, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.BSEL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.BST_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.BSTA, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC0_.BTDR, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC0_.BTMX, MutexObj)
    External (_SB_.PCI0.LPCB.EC0_.CRZN, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.ECMX, MutexObj)
    External (_SB_.PCI0.LPCB.EC0_.ECRG, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.GACS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC0_.GBMF, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC0_.GBSS, MethodObj)    // 2 Arguments
    External (_SB_.PCI0.LPCB.EC0_.GCTL, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC0_.GDCH, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC0_.GDNM, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPCB.EC0_.IDIS, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.INAC, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.INCH, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.LB1_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.LB2_, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.NDCB, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.NGBF, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.NGBT, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.NLB1, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.NLB2, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.NLO2, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.PSSB, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.TEMP, FieldUnitObj)
    External (BATN, IntObj)
    External (BRCC, IntObj)
    External (BRCV, IntObj)
    External (BST_, IntObj)
    External (ECRG, IntObj)
    External (NDBS, IntObj)
    External (NGBF, IntObj)
    External (NGBT, IntObj)

    Scope (\_SB.PCI0.LPCB.EC0)
    {
        OperationRegion (ECR2, EmbeddedControl, Zero, 0xFF)
        Field (ECR2, ByteAcc, NoLock, Preserve)
        {
            Offset (0x87), 
            Offset (0x88), 
            Offset (0x89), 
            BDC0,   8, 
            BDC1,   8, 
            Offset (0x8D), 
            BFC0,   8, 
            BFC1,   8, 
            RTE0,   8, 
            RTE1,   8, 
            Offset (0x92), 
            BME0,   8, 
            BME1,   8, 
            Offset (0x95), 
            BDV0,   8, 
            BDV1,   8, 
            BCX0,   8, 
            BCX1,   8, 
            Offset (0x9B), 
            ATE0,   8, 
            ATE1,   8, 
            BPR0,   8, 
            BPR1,   8, 
            BCR0,   8, 
            BCR1,   8, 
            BRC0,   8, 
            BRC1,   8, 
            BCC0,   8, 
            BCC1,   8, 
            BPV0,   8, 
            BPV1,   8, 
            BCA0,   8, 
            BCA1,   8, 
            BCB0,   8, 
            BCB1,   8, 
            BCP0,   8, 
            BCP1,   8, 
            Offset (0xAF), 
            ATF0,   8, 
            ATF1,   8, 
            Offset (0xB3), 
            AXC0,   8, 
            AXC1,   8, 
            Offset (0xB6), 
                ,   1, 
                ,   1, 
                ,   2, 
            Offset (0xB7), 
            BST0,   8, 
            BST1,   8, 
            Offset (0xC9), 
            BSN0,   8, 
            BSN1,   8, 
            BDA0,   8, 
            BDA1,   8, 
            Offset (0xE0), 
            CBT0,   8, 
            CBT1,   8, 
            Offset (0xF6), 
            Offset (0xF7), 
            Offset (0xF8), 
            Offset (0xF9), 
            ACP0,   8, 
            ACP1,   8
        }

        Method (BTIF, 1, Serialized)
        {
            Local7 = (One << Arg0)
            BTDR (One)
            If ((BSTA (Local7) == 0x0F))
            {
                Return (0xFF)
            }

            Acquire (BTMX, 0xFFFF)
            Local0 = NGBF /* External reference */
            Release (BTMX)
            If (((Local0 & Local7) == Zero))
            {
                Return (Zero)
            }

            NBST [Arg0] = NDBS /* External reference */
            Acquire (BTMX, 0xFFFF)
            NGBT |= Local7
            Release (BTMX)
            Acquire (ECMX, 0xFFFF)
            If (ECRG)
            {
                BSEL = Arg0
                Local0 = B1B2 (BDC0, BDC1)
                DerefOf (NBTI [Arg0]) [One] = Local0
                Local0 = B1B2 (BFC0, BFC1)
                DerefOf (NBTI [Arg0]) [0x02] = Local0
                DerefOf (NBTI [Arg0]) [0x04] = B1B2 (BDV0, BDV1)
                Local0 = (B1B2 (BFC0, BFC1) * NLB1) /* External reference */
                Local4 = (Local0 / 0x64)
                DerefOf (NBTI [Arg0]) [0x05] = Local4
                Local0 = (B1B2 (BFC0, BFC1) * NLO2) /* External reference */
                Local4 = (Local0 / 0x64)
                DerefOf (NBTI [Arg0]) [0x06] = Local4
                Local0 = B1B2 (BSN0, BSN1)
                Local1 = B1B2 (BDA0, BDA1)
                DerefOf (NBTI [Arg0]) [0x0D] = B1B2 (BCC0, BCC1)
                Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
                \_SB.PCI0.LPCB.EC0.CRZN = 0x05
                Local2 = \_SB.PCI0.LPCB.EC0.TEMP /* External reference */
                Release (\_SB.PCI0.LPCB.EC0.ECMX)
                Local2 = ((Local2 * 0x0A) + 0x0AAC)
                DerefOf (NBTI [Arg0]) [0x0E] = Local2
            }

            Release (ECMX)
            Local2 = GBSS (Local0, Local1)
            DerefOf (NBTI [Arg0]) [0x0A] = Local2
            Acquire (BTMX, 0xFFFF)
            NGBF &= ~Local7
            Release (BTMX)
            Return (Zero)
        }

        Method (BTIX, 1, Serialized)
        {
            Local7 = (One << Arg0)
            BTDR (One)
            If ((BSTA (Local7) == 0x0F))
            {
                Return (0xFF)
            }

            Acquire (BTMX, 0xFFFF)
            Local0 = NGBF /* External reference */
            Release (BTMX)
            If (((Local0 & Local7) == Zero))
            {
                Return (Zero)
            }

            NBST [Arg0] = NDBS /* External reference */
            Acquire (BTMX, 0xFFFF)
            NGBT |= Local7
            Release (BTMX)
            Acquire (ECMX, 0xFFFF)
            If (ECRG)
            {
                BSEL = Arg0
                Local0 = B1B2 (BDC0, BDC1)
                DerefOf (NBTE [Arg0]) [0x02] = Local0
                Local0 = B1B2 (BFC0, BFC1)
                DerefOf (NBTE [Arg0]) [0x03] = Local0
                DerefOf (NBTE [Arg0]) [0x05] = B1B2 (BDV0, BDV1)
                Local0 = (B1B2 (BFC0, BFC1) * NLB1) /* External reference */
                Local4 = (Local0 / 0x64)
                DerefOf (NBTE [Arg0]) [0x06] = Local4
                Local0 = (B1B2 (BFC0, BFC1) * NLO2) /* External reference */
                Local4 = (Local0 / 0x64)
                DerefOf (NBTE [Arg0]) [0x07] = Local4
                Local0 = B1B2 (BSN0, BSN1)
                Local1 = B1B2 (BDA0, BDA1)
                DerefOf (NBTE [Arg0]) [0x08] = B1B2 (BCC0, BCC1)
            }

            Release (ECMX)
            Local2 = GBSS (Local0, Local1)
            DerefOf (NBTE [Arg0]) [0x11] = Local2
            Acquire (BTMX, 0xFFFF)
            NGBF &= ~Local7
            Release (BTMX)
            Return (Zero)
        }

        Method (BTST, 2, Serialized)
        {
            Local7 = (One << Arg0)
            BTDR (One)
            If ((BSTA (Local7) == 0x0F))
            {
                NBST [Arg0] = Package (0x04)
                    {
                        Zero, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }
                Return (0xFF)
            }

            Acquire (BTMX, 0xFFFF)
            If (Arg1)
            {
                NGBT = 0xFF
            }

            Local0 = NGBT /* External reference */
            Release (BTMX)
            If (((Local0 & Local7) == Zero))
            {
                Return (Zero)
            }

            Acquire (ECMX, 0xFFFF)
            If (ECRG)
            {
                BSEL = Arg0
                Local0 = BST /* External reference */
                Local3 = B1B2 (BPR0, BPR1)
                DerefOf (NBST [Arg0]) [0x02] = B1B2 (BRC0, BRC1)
                DerefOf (NBST [Arg0]) [0x03] = B1B2 (BPV0, BPV1)
            }

            Release (ECMX)
            If ((GACS () == One))
            {
                Local0 &= 0xFFFFFFFFFFFFFFFE
            }
            Else
            {
                Local0 &= 0xFFFFFFFFFFFFFFFD
            }

            If ((Local0 & One))
            {
                Acquire (BTMX, 0xFFFF)
                NDCB = Local7
                Release (BTMX)
            }

            DerefOf (NBST [Arg0]) [Zero] = Local0
            If ((Local0 & One))
            {
                If (((Local3 < 0x0190) || (Local3 > 0x1964)))
                {
                    Local5 = DerefOf (DerefOf (NBST [Arg0]) [One])
                    If (((Local5 < 0x0190) || (Local5 > 0x1964)))
                    {
                        Local3 = 0x0D7A
                    }
                    Else
                    {
                        Local3 = Local5
                    }
                }
            }
            ElseIf (((Local0 & 0x02) == Zero))
            {
                Local3 = Zero
            }

            DerefOf (NBST [Arg0]) [One] = Local3
            Acquire (BTMX, 0xFFFF)
            NGBT &= ~Local7
            Release (BTMX)
            Return (Zero)
        }

        Method (ITLB, 0, NotSerialized)
        {
            Local0 = (B1B2 (BFC0, BFC1) * NLB1) /* External reference */
            Local4 = (Local0 / 0x64)
            Divide ((Local4 + 0x09), 0x0A, Local0, Local1)
            Local0 = (B1B2 (BFC0, BFC1) * NLB2) /* External reference */
            Local4 = (Local0 / 0x64)
            Divide ((Local4 + 0x09), 0x0A, Local0, Local2)
            If (ECRG)
            {
                LB1 = Local1
                LB2 = Local2
            }
        }

        Method (GBTI, 1, NotSerialized)
        {
            Debug = "Enter getbattinfo"
            Acquire (ECMX, 0xFFFF)
            If (ECRG)
            {
                If ((BATP & (One << Arg0)))
                {
                    BSEL = Arg0
                    Local0 = Package (0x02)
                        {
                            Zero, 
                            Buffer (0x6B){}
                        }
                    DerefOf (Local0 [One]) [Zero] = B1B2 (BDC0, BDC1)
                    DerefOf (Local0 [One]) [One] = (B1B2 (BDC0, BDC1) >> 
                        0x08)
                    DerefOf (Local0 [One]) [0x02] = B1B2 (BFC0, BFC1)
                    DerefOf (Local0 [One]) [0x03] = (B1B2 (BFC0, BFC1) >> 
                        0x08)
                    DerefOf (Local0 [One]) [0x04] = B1B2 (BRC0, BRC1)
                    DerefOf (Local0 [One]) [0x05] = (B1B2 (BRC0, BRC1) >> 
                        0x08)
                    DerefOf (Local0 [One]) [0x06] = B1B2 (BME0, BME1)
                    DerefOf (Local0 [One]) [0x07] = (B1B2 (BME0, BME1) >> 
                        0x08)
                    DerefOf (Local0 [One]) [0x08] = B1B2 (BCC0, BCC1)
                    DerefOf (Local0 [One]) [0x09] = (B1B2 (BCC0, BCC1) >> 
                        0x08)
                    Local1 = B1B2 (CBT0, CBT1)
                    Local1 -= 0x0AAC
                    Divide (Local1, 0x0A, Local2, Local3)
                    DerefOf (Local0 [One]) [0x0A] = Local3
                    DerefOf (Local0 [One]) [0x0B] = (Local3 >> 0x08)
                    DerefOf (Local0 [One]) [0x0C] = B1B2 (BPV0, BPV1)
                    DerefOf (Local0 [One]) [0x0D] = (B1B2 (BPV0, BPV1) >> 
                        0x08)
                    Local1 = B1B2 (BPR0, BPR1)
                    If (Local1)
                    {
                        If ((B1B2 (BST0, BST1) & 0x40))
                        {
                            Local1 = (~Local1 + One)
                            Local1 &= 0xFFFF
                        }
                    }

                    DerefOf (Local0 [One]) [0x0E] = Local1
                    DerefOf (Local0 [One]) [0x0F] = (Local1 >> 0x08)
                    DerefOf (Local0 [One]) [0x10] = B1B2 (BDV0, BDV1)
                    DerefOf (Local0 [One]) [0x11] = (B1B2 (BDV0, BDV1) >> 
                        0x08)
                    DerefOf (Local0 [One]) [0x12] = B1B2 (BST0, BST1)
                    DerefOf (Local0 [One]) [0x13] = (B1B2 (BST0, BST1) >> 
                        0x08)
                    DerefOf (Local0 [One]) [0x14] = B1B2 (BCX0, BCX1)
                    DerefOf (Local0 [One]) [0x15] = (B1B2 (BCX0, BCX1) >> 
                        0x08)
                    DerefOf (Local0 [One]) [0x16] = B1B2 (BCA0, BCA1)
                    DerefOf (Local0 [One]) [0x17] = (B1B2 (BCA0, BCA1) >> 
                        0x08)
                    DerefOf (Local0 [One]) [0x18] = B1B2 (BCB0, BCB1)
                    DerefOf (Local0 [One]) [0x19] = (B1B2 (BCB0, BCB1) >> 
                        0x08)
                    DerefOf (Local0 [One]) [0x1A] = B1B2 (BCP0, BCP1)
                    DerefOf (Local0 [One]) [0x1B] = (B1B2 (BCP0, BCP1) >> 
                        0x08)
                    CreateField (DerefOf (Local0 [One]), 0xE0, 0x80, BTSN)
                    BTSN = GBSS (B1B2 (BSN0, BSN1), B1B2 (BDA0, BDA1))
                    Local1 = GBMF ()
                    Local2 = SizeOf (Local1)
                    CreateField (DerefOf (Local0 [One]), 0x0160, (Local2 * 0x08), BMAN)
                    BMAN = Local1
                    Local2 += 0x2C
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x80, CLBL)
                    CLBL = GCTL (Zero)
                    Local2 += 0x11
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x38, DNAM)
                    DNAM = GDNM (Zero)
                    Local2 += 0x07
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x20, DCHE)
                    DCHE = GDCH (Zero)
                    Local2 += 0x04
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x10, BMAC)
                    BMAC = Zero
                    Local2 += 0x02
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x10, BMAD)
                    BMAD = B1B2 (BDA0, BDA1)
                    Local2 += 0x02
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x10, BCCU)
                    BCCU = BRCC /* External reference */
                    Local2 += 0x02
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x10, BCVO)
                    BCVO = BRCV /* External reference */
                    Local2 += 0x02
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x10, BAVC)
                    Local1 = B1B2 (BCR0, BCR1)
                    If (Local1)
                    {
                        If ((B1B2 (BST0, BST1) & 0x40))
                        {
                            Local1 = (~Local1 + One)
                            Local1 &= 0xFFFF
                        }
                    }

                    BAVC = Local1
                    Local2 += 0x02
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x10, RTTE)
                    RTTE = B1B2 (RTE0, RTE1)
                    Local2 += 0x02
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x10, ATTE)
                    RTTE = B1B2 (ATE0, ATE1)
                    Local2 += 0x02
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x10, ATTF)
                    RTTE = B1B2 (ATF0, ATF1)
                    Local2 += 0x02
                    CreateField (DerefOf (Local0 [One]), (Local2 * 0x08), 0x08, NOBS)
                    NOBS = BATN /* External reference */
                }
                Else
                {
                    Local0 = Package (0x01)
                        {
                            0x34
                        }
                }
            }
            Else
            {
                Local0 = Package (0x01)
                    {
                        0x0D
                    }
            }

            Release (ECMX)
            Return (Local0)
        }

        Method (GBTC, 0, NotSerialized)
        {
            Debug = "Enter GetBatteryControl"
            Acquire (ECMX, 0xFFFF)
            If (ECRG)
            {
                Local0 = Package (0x02)
                    {
                        Zero, 
                        Buffer (0x04){}
                    }
                If ((BATP & One))
                {
                    BSEL = Zero
                    DerefOf (Local0 [One]) [Zero] = Zero
                    If ((((INAC == Zero) && (INCH == Zero)) && (IDIS == Zero)))
                    {
                        DerefOf (Local0 [One]) [Zero] = Zero
                    }
                    ElseIf (((((INAC == Zero) && (INCH == 0x02)) && (
                        IDIS == One)) && (B1B2 (AXC0, AXC1) == Zero)))
                    {
                        DerefOf (Local0 [One]) [Zero] = One
                    }
                    ElseIf (((INAC == One) && (IDIS == 0x02)))
                    {
                        DerefOf (Local0 [One]) [Zero] = 0x02
                    }
                    ElseIf (((((INAC == Zero) && (INCH == 0x02)) && (
                        IDIS == One)) && (B1B2 (AXC0, AXC1) == 0xFA)))
                    {
                        DerefOf (Local0 [One]) [Zero] = 0x03
                    }
                    ElseIf (((INAC == Zero) && (INCH == 0x03)))
                    {
                        DerefOf (Local0 [One]) [Zero] = 0x04
                    }
                }
                Else
                {
                    DerefOf (Local0 [One]) [Zero] = 0xFF
                }

                If ((BATP & 0x02))
                {
                    BSEL = One
                    DerefOf (Local0 [One]) [One] = Zero
                    If ((((INAC == Zero) && (INCH == Zero)) && (IDIS == Zero)))
                    {
                        DerefOf (Local0 [One]) [One] = Zero
                    }
                    ElseIf (((((INAC == Zero) && (INCH == One)) && (
                        IDIS == 0x02)) && (B1B2 (AXC0, AXC1) == Zero)))
                    {
                        DerefOf (Local0 [One]) [One] = One
                    }
                    ElseIf (((INAC == One) && (IDIS == One)))
                    {
                        DerefOf (Local0 [One]) [One] = 0x02
                    }
                    ElseIf (((((INAC == Zero) && (INCH == One)) && (
                        IDIS == 0x02)) && (B1B2 (AXC0, AXC1) == 0xFA)))
                    {
                        DerefOf (Local0 [One]) [One] = 0x03
                    }
                    ElseIf (((INAC == Zero) && (INCH == 0x03)))
                    {
                        DerefOf (Local0 [One]) [One] = 0x04
                    }
                }
                Else
                {
                    DerefOf (Local0 [One]) [One] = 0xFF
                }
            }
            Else
            {
                Local0 = Package (0x02)
                    {
                        0x35, 
                        Zero
                    }
            }

            Release (ECMX)
            Return (Local0)
        }

        Method (GACW, 0, NotSerialized)
        {
            Local0 = Zero
            Acquire (ECMX, 0xFFFF)
            If (ECRG)
            {
                Local0 = B1B2 (ACP0, ACP1)
            }

            Release (ECMX)
            Return (Local0)
        }

        Method (GBAW, 0, NotSerialized)
        {
            Local0 = Zero
            Acquire (ECMX, 0xFFFF)
            If (ECRG)
            {
                Local1 = B1B2 (BDV0, BDV1)
                Local2 = B1B2 (BDC0, BDC1)
                Local0 = (Local1 * Local2)
                Divide (Local0, 0x000F4240, Local3, Local0)
                If ((Local3 >= 0x0007A120))
                {
                    Local0++
                }
            }

            Release (ECMX)
            Return (Local0)
        }

        Method (SBTC, 3, NotSerialized)
        {
            Debug = "Enter SetBatteryControl"
            Acquire (ECMX, 0xFFFF)
            If (ECRG)
            {
                Local0 = Arg2
                Debug = Local0
                Local4 = Package (0x01)
                    {
                        0x06
                    }
                Local1 = Zero
                Local2 = Zero
                Local1 = DerefOf (Local0 [Zero])
                If ((Local1 == Zero))
                {
                    Debug = "battery 0"
                    If ((BATP & One))
                    {
                        Local2 = DerefOf (Local0 [One])
                        If ((Local2 == Zero))
                        {
                            INCH = Zero
                            IDIS = Zero
                            INAC = Zero
                            AXC0 = Zero
                            AXC1 = Zero
                            PSSB = One
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }

                        If ((Local2 == One))
                        {
                            INAC = Zero
                            INCH = 0x02
                            IDIS = One
                            AXC0 = Zero
                            AXC1 = Zero
                            PSSB = Zero
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }

                        If ((Local2 == 0x02))
                        {
                            INAC = One
                            INCH = One
                            IDIS = 0x02
                            PSSB = Zero
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }

                        If ((Local2 == 0x03))
                        {
                            INCH = 0x02
                            IDIS = One
                            INAC = Zero
                            AXC0 = 0xFA
                            AXC1 = Zero
                            PSSB = Zero
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }

                        If ((Local2 == 0x04))
                        {
                            AXC0 = 0xFA
                            AXC1 = Zero
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }

                        If ((Local2 == 0x05))
                        {
                            INAC = Zero
                            INCH = 0x03
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }
                    }
                    Else
                    {
                        Local4 = Package (0x01)
                            {
                                0x34
                            }
                    }
                }

                If ((Local1 == One))
                {
                    If ((BATP & 0x02))
                    {
                        Debug = "battery 1"
                        Local2 = DerefOf (Local0 [One])
                        If ((Local2 == Zero))
                        {
                            INCH = Zero
                            IDIS = Zero
                            INAC = Zero
                            AXC0 = Zero
                            AXC1 = Zero
                            PSSB = One
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }

                        If ((Local2 == One))
                        {
                            INAC = Zero
                            INCH = One
                            IDIS = 0x02
                            AXC0 = Zero
                            AXC1 = Zero
                            PSSB = Zero
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }

                        If ((Local2 == 0x02))
                        {
                            INAC = One
                            INCH = 0x02
                            IDIS = One
                            PSSB = Zero
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }

                        If ((Local2 == 0x03))
                        {
                            INCH = One
                            IDIS = 0x02
                            INAC = Zero
                            AXC0 = 0xFA
                            AXC1 = Zero
                            PSSB = Zero
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }

                        If ((Local2 == 0x04))
                        {
                            INCH = Zero
                            IDIS = Zero
                            INAC = Zero
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }

                        If ((Local2 == 0x05))
                        {
                            INAC = Zero
                            INCH = 0x03
                            Local4 = Package (0x01)
                                {
                                    Zero
                                }
                        }
                    }
                    Else
                    {
                        Local4 = Package (0x01)
                            {
                                0x34
                            }
                    }
                }
            }

            Release (ECMX)
            Return (Local4)
        }
    }

    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }
}

