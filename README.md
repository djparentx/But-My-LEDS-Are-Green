R36S LED Color Switcher

A simple Bash installer for the R36S that corrects LED color controls by replacing the default blue LED script with proper red and green toggle options, matching the actual hardware.

Description:

This script fixes incorrect LED behavior on the R36S by replacing the original “blue” LED toggle with accurate red and green options.

It installs two menu-accessible scripts that control the power LED via GPIO77, updates related system services, and ensures the selected color persists across reboots.

Features:
- Replaces incorrect “blue LED” script with proper green toggle
- Adds working red and green LED switch options
 -Persistent LED state across reboots
- Updates battery warning script to match LED color
- Automatically restarts EmulationStation after changes
- Self-removes installer after execution

Requirements:
- R36S device
- ArkOS / dArkOSRE environment

Installation:
- Copy the script to your Tools folder
- Run it

The installer will:
- Create LED toggle scripts (red and green)
- Replace the incorrect blue LED script
- Remove itself after completion

After installation:
- Open the Options/System menu on your R36S
    - Select:
      - Change LED to Red
      - Change LED to Green

The system will:
- Update the LED color immediately
- Restart EmulationStation
- Save the selected color for next boot


How It Works:
- Exports and configures GPIO77 for LED control
- Sets LED state:
    - 1 = Red
    - 0 = Green
- Replaces:
  - batt_life_warning.py with color-specific version
  - fix_power_led script to persist LED state on boot

Updates system menu scripts dynamically:
- Only shows the opposite color as a toggle option

Notes:
- The original script referenced a blue LED, which does not exist on the R36S
- This version corrects that by mapping to the actual hardware colors
- Safe to re-run, but not necessary after installation
- Designed specifically for R36S devices

License:

MIT License

Copyright (c) 2026 djparent
