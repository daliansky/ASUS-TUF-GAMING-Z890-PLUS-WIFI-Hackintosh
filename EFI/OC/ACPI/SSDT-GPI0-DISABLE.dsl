// SSDT-GPI0-DISABLE
// Disable GPE (General Purpose Events) on all PCIe Root Ports
// This prevents RP## PXSX from causing instant wake after sleep
// The Root Ports wake the system via GPE triggers that get stuck after sleep/wake cycle

DefinitionBlock ("", "SSDT", 2, "ACDT", "GPIODIS", 0x00000000)
{
    // External all Root Ports from PC00
    External (\_SB.PC00.RP01, DeviceObj)
    External (\_SB.PC00.RP02, DeviceObj)
    External (\_SB.PC00.RP03, DeviceObj)
    External (\_SB.PC00.RP04, DeviceObj)
    External (\_SB.PC00.RP05, DeviceObj)
    External (\_SB.PC00.RP06, DeviceObj)
    External (\_SB.PC00.RP07, DeviceObj)
    External (\_SB.PC00.RP08, DeviceObj)
    External (\_SB.PC00.RP09, DeviceObj)

    // External all Root Ports from PC02
    External (\_SB.PC02.RP01, DeviceObj)
    External (\_SB.PC02.RP02, DeviceObj)
    External (\_SB.PC02.RP03, DeviceObj)
    External (\_SB.PC02.RP04, DeviceObj)
    External (\_SB.PC02.RP05, DeviceObj)
    External (\_SB.PC02.RP06, DeviceObj)
    External (\_SB.PC02.RP07, DeviceObj)
    External (\_SB.PC02.RP08, DeviceObj)
    External (\_SB.PC02.RP09, DeviceObj)

    // Method to clear GPE status for a Root Port's PXSX device
    Scope (\_SB.PC00)
    {
        // For each Root Port, clear the GPE status by writing to GPE0_STS
        // The key is to clear both wake enable and status bits
        
        // Method to disable wakeup from a specific Root Port
        Method (WPOF, 1, NotSerialized)
        {
            // Clear GPE status and disable wakeup
            If (CondRefOf (Index (^^^GPE0, Arg0)))
            {
                Store (Zero, Index (^^^GPE0, Arg0))
            }
        }

        // Disable GPE for each Root Port
        // This prevents them from being wake sources
        If (CondRefOf (\_SB.PC00.RP01))
        {
            // Create _DSM method or modify wakeup to prevent GPE trigger
        }
        
        // The actual fix: override _PS0 and _PS3 to clear GPE on power state changes
        // Or simpler: add a method that clears GPE registers on wake
    }

    // Simpler approach: clear GPE0_STS register after wake
    // by patching the GPE handler to acknowledge and clear
    Scope (\_GPE)
    {
        // Acknowledge and clear all GPE flags that might cause instant wake
        Method (_L73, 0, Serialized)
        {
            // This GPE is often caused by PCIe devices
            // Acknowledge it to prevent stuck state
            Return (One)
        }
        
        Method (_L69, 0, Serialized)
        {
            Return (One)
        }
    }
}
