# Z890 Hackintosh

Intel Z890 platform Hackintosh configuration based on OpenCore.

## System Overview

| Component | Specification |
|-----------|---------------|
| **Motherboard** | ASUSTEK TUF GAMING Z890-PLUS WIFI |
| **Chipset** | Z890 |
| **CPU** | Intel Core Ultra 7 265K (Arrow Lake-S, 20 cores) |
| **GPU** | AMD Radeon RX 6600 XT (Navi 23) |
| **Firmware** | UEFI (OpenCore) |
| **BIOS Version** | 2401 (Released 2025-09-12) |

## Storage

| Drive | Controller | Model |
|-------|-----------|-------|
| NVMe #1 | Lexar NM790 | GLOWAY YCQ2TNVMe-M.2/80 |
| NVMe #2 | Lexar NM790 | Lexar SSD ARES 4TB |
| SATA/PCIe | 2550 NVMe SSD | CT1000P3PSSD8 (Crucial P3 Plus) |

## Audio

- **AMD High Definition Audio** — HDMI/DP audio via RX 6600 XT
- **Realtek ALC1168** — onboard HD audio (10EC-1168)

## Network

- **Intel I226-V** — Gigabit Ethernet (8086-125C)

## USB

- Intel USB 3.20 xHCI Controller (PCI: d,0)
- Intel USB 3.20 xHCI Controller (PCI: 14,0)
- USB4 Host Router

## Display

| Monitor | Connection | Resolution |
|---------|-----------|------------|
| X27 Fusion | DisplayPort | 1920x1080 |
| RV100 (LG) | HDMI | 3840x2160 |

## Input Devices

- Apple Aluminium Keyboard (ANSI) — USB
- Apple Magic Mouse — USB
- Generic USB HID device (0B05-19AF)

## ACPI

- Custom SSDT/DSDT patches applied
- Multiple ACPI fan controls (FAN0-FAN4)
- Thermal zones configured
- GPIO/I2C controllers enabled for peripheral support

## BIOS Settings

- Secure Boot: **Disabled**
- Firmware Type: UEFI
- System Type: x64-based

## Reference

Hardware profile exported from [report.json](report.json).
