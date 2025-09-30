## What *wayland compositor* do

Your computer has *input* and *output* devices.

Input devices are:
- Keyboards
- Mice
- Touchpads
- Touch screens
- Drawing tablets

Output device is display.

Role of the **Wayland compositor** is to dispatch input events to the appropriate **Wayland client** and to display
their windows in their appropriate place on your output.

Example of wayland compositors:
- [Sway](https://github.com/swaywm/sway): An i3-compatible Wayland compositor.
- [Hyprland](https://github.com/hyprwm/Hyprland): Dynamic tilling Wayland compositor
- [Cosmic](https://github.com/pop-os/cosmic-epoch): Next generation Cosmic desktop environment
- [Niri](https://github.com/YaLTeR/niri): A scrollable-tilling Wayland compositor

## Libwayland components

### The `wl_display` interface




