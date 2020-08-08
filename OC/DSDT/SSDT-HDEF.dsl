/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLCRzsIf.aml, Sat Aug  8 02:31:04 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001BD (445)
 *     Revision         0x02
 *     Checksum         0x15
 *     OEM ID           "hack"
 *     OEM Table ID     "HDEF"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20170929 (538380585)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "HDEF", 0x00000000)
{
    External (_SB_.PCI0.HDEF, DeviceObj)
    External (RMCF.AUDL, IntObj)

    Method (_SB.PCI0.HDEF._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (CondRefOf (\RMCF.AUDL))
        {
            If ((Ones == \RMCF.AUDL))
            {
                Return (Zero)
            }
        }

        If (!Arg2)
        {
            Return (Buffer (One)
            {
                 0x03                                             // .
            })
        }

        Local0 = Package (0x14)
            {
                "AAPL,slot-name", 
                "Built In", 
                "name", 
                "Realtek Audio Controller", 
                "model", 
                Buffer (0x21)
                {
                    "Realtek ALC3246 Audio Controller"
                }, 

                "device_type", 
                Buffer (0x11)
                {
                    "Audio Controller"
                }, 

                "layout-id", 
                Buffer (0x04)
                {
                     0x0D, 0x00, 0x00, 0x00                           // ....
                }, 

                "MaximumBootBeepVolume", 
                Buffer (One)
                {
                     0x01                                             // .
                }, 

                "built-in", 
                Buffer (One)
                {
                     0x00                                             // .
                }, 

                "hda-gfx", 
                Buffer (0x0A)
                {
                    "onboard-1"
                }, 

                "RM,device-id", 
                Buffer (0x04)
                {
                     0x70, 0x9D, 0x00, 0x00                           // p...
                }, 

                "PinConfigurations", 
                Buffer (One)
                {
                     0x00                                             // .
                }
            }
        If (CondRefOf (\RMCF.AUDL))
        {
            CreateDWordField (DerefOf (Local0 [One]), Zero, AUDL)
            AUDL = \RMCF.AUDL /* External reference */
        }

        Return (Local0)
    }
}

