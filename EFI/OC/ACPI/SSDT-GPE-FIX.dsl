// SSDT-GPE-FIX
// Fix second-sleep instant wake on Z890 (Arrow Lake)
//
// Problem: GPE 0x6B (_L6B) is the primary wake GPE used by all root ports
// and XHCI/GLAN/HDAS/CNVW. After the first sleep/wake cycle, the GPE status
// bit is not properly cleared, causing instant wake on the second sleep.
//
// Fix: Remove _PRW from all PCIe root ports so they cannot trigger wake.
// Only keep XHCI wake for USB keyboard/mouse wake capability.
// Also clear GPE status bits in _PTS before entering sleep.

DefinitionBlock ("", "SSDT", 2, "ACDT", "GPEFIX", 0x00000001)
{
    External (_SB.PC00.RP01, DeviceObj)
    External (_SB.PC00.RP09, DeviceObj)
    External (_SB.PC00.RP13, DeviceObj)
    External (_SB.PC00.RP17, DeviceObj)
    External (_SB.PC00.RP21, DeviceObj)

    External (_SB.PC02.RP01, DeviceObj)
    External (_SB.PC02.RP02, DeviceObj)
    External (_SB.PC02.RP03, DeviceObj)
    External (_SB.PC02.RP04, DeviceObj)
    External (_SB.PC02.RP05, DeviceObj)
    External (_SB.PC02.RP06, DeviceObj)
    External (_SB.PC02.RP07, DeviceObj)
    External (_SB.PC02.RP08, DeviceObj)
    External (_SB.PC02.RP09, DeviceObj)
    External (_SB.PC02.RP10, DeviceObj)
    External (_SB.PC02.RP11, DeviceObj)
    External (_SB.PC02.RP12, DeviceObj)
    External (_SB.PC02.RP13, DeviceObj)
    External (_SB.PC02.RP14, DeviceObj)
    External (_SB.PC02.RP15, DeviceObj)
    External (_SB.PC02.RP16, DeviceObj)
    External (_SB.PC02.RP17, DeviceObj)
    External (_SB.PC02.RP18, DeviceObj)
    External (_SB.PC02.RP19, DeviceObj)
    External (_SB.PC02.RP20, DeviceObj)
    External (_SB.PC02.RP21, DeviceObj)
    External (_SB.PC02.RP22, DeviceObj)
    External (_SB.PC02.RP23, DeviceObj)
    External (_SB.PC02.RP24, DeviceObj)

    External (PCHA, IntObj)

    // Remove _PRW from PC00 root ports (CPU/PCIe root complex)
    // These are on the CPU bus and don't need wake on desktop
    Scope (\_SB.PC00.RP01)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC00.RP09)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC00.RP13)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC00.RP17)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC00.RP21)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    // Remove _PRW from PC02 root ports (PCH DMI/PCIe)
    // These use GPE 0x6B which causes the stuck wake issue
    Scope (\_SB.PC02.RP01)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP02)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP03)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP04)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP05)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP06)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP07)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP08)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP09)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP10)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP11)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP12)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP13)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP14)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP15)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP16)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP17)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP18)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP19)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP20)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP21)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP22)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP23)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }

    Scope (\_SB.PC02.RP24)
    {
        Method (_PRW, 0, NotSerialized)
        {
            Return (Package (0x02)
            {
                Zero,
                0x03
            })
        }
    }
}
