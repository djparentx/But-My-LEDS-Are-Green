## But My LEDS Are Green

---

## description:
  Fixes incorrect LED behavior on the R36S by replacing the default “blue” LED script
  with accurate red and green toggle options that match the actual hardware.

---

## overview:
  - Corrects LED color handling on the R36S
  - Replaces incorrect “blue LED” script with proper green functionality
  - Installs working red and green toggle scripts
  - Ensures LED state persists across reboots

---

## features:
  - Replaces invalid “blue LED” option with correct green toggle
  - Adds red and green LED switching via system menu
  - Persistent LED color across reboots
  - Updates battery warning script to match selected LED color
  - Automatically restarts EmulationStation after changes
  - Self-removing installer after execution

---

## requirements:
  - R36S device
  - ArkOS or dArkOSRE environment

---

## installation:
   1) Copy script to device (Tools folder recommended)
   2) Run the script

---

 ## actions:
   - Create LED toggle scripts (red and green)
   - Replace incorrect blue LED script
   - Update permissions and system menu integration
   - Remove installer after completion

---

## notes:
  - Original script referenced a non-existent blue LED on R36S
  - This version maps correctly to real hardware (red/green only)
  - Safe to re-run but unnecessary after installation
  - Designed specifically for R36S devices

---

## license:
  type: MIT
  
  year: 2026
  
  author: djparent
