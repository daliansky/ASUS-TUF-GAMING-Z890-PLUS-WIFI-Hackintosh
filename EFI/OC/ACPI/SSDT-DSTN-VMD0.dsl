// SSDT-DSTN-VMD0
// Disable VMD0 controller by adding _STA = 0 (not present)
// This hides VMD0 from macOS, preventing VT-d/IOMMU initialization
// The VMD0 device already exists in DSDT, we just override its _STA

DefinitionBlock ("", "SSDT", 2, "ACDT", "DSTNVMD0", 0x00000000)
{
    External (\_SB.PC00.VMD0, DeviceObj)

    Scope (\_SB.PC00.VMD0)
    {
        Name (_STA, 0x00)  // Bit 0 clear = not present
    }
}
