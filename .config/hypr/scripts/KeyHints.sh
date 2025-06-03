#!/bin/bash

# GDK BACKEND. Change to either wayland or x11 if having issues
BACKEND=wayland

# Check if rofi or yad is running and kill them if they are
if pidof rofi > /dev/null; then
  pkill rofi
fi

if pidof yad > /dev/null; then
  pkill yad
fi

# Launch yad with calculated width and height
GDK_BACKEND=$BACKEND yad \
    --center \
    --title="Quick Cheat Sheet" \
    --no-buttons \
    --list \
    --column=Key: \
    --column=Description: \
    --column=Command: \
    --timeout-indicator=bottom \
"ESC" "close this app" "" " = " "SUPER KEY (Windows Key Button)" "(SUPER KEY)" \
" SHIFT K" "Searchable Keybinds" "(Search all Keybinds via rofi)" \
" SHIFT S" "Settings Menu" "" \
"" "" "" \
" Q" "Terminal" "(kitty)" \
" SHIFT Q" "DropDown Terminal" " W to close" \
" B" "Launch Browser" "(Default browser)" \
" SPACE" "Application Launcher" "(rofi-wayland)" \
" E" "Open File Manager" "(Thunar)" \
" S" "Google Search using rofi" "(rofi)" \
" W" "close active window" "(not kill)" \
" ALT W " "kills an active window" "(kill)" \
" ALT mouse scroll up/down   " "Desktop Zoom" "Desktop Magnifier" \
" Alt V" "Clipboard Manager" "(cliphist)" \
" Alt W" "Choose wallpaper" "(Wallpaper Menu)" \
" Shift W" "Choose wallpaper effects" "(imagemagick + swww)" \
" CTRL ALT B" "Hide/UnHide Waybar" "waybar" \
" ALT R" "Reload Waybar swaync Rofi" "CHECK NOTIFICATIONS FIRST!!!" \
" Print" "screenshot" "(grim)" \
" Shift Print" "screenshot region" "(grim + slurp)" \
" ALT S" "screenshot region" "(swappy)" \
" CTRL Print" "screenshot timer 5 secs " "(grim)" \
" CTRL SHIFT Print" "screenshot timer 10 secs " "(grim)" \
" ALT P" "power-menu" "(wlogout)" \
" ALT L" "screen lock" "(hyprlock)" \
"CTRL ALT Del" "Hyprland Exit" "(NOTE: Hyprland Will exit immediately)" \
" SHIFT F" "Fullscreen" "Toggles to full screen" \
" CTL F" "Fake Fullscreen" "Toggles to fake full screen" \
" ALT L" "Toggle Dwindle | Master Layout" "Hyprland Layout" \
" F" "Toggle float" "single window" \
" ALT F" "Toggle all windows to float" "all windows" \
" ALT O" "Toggle Blur" "normal or less blur" \
" CTRL O" "Toggle Opaque ON or OFF" "on active window only" \
" ALT E" "Rofi Emoticons" "Emoticon" \
" H" "Launch this Quick Cheat Sheet" "" \
"" "" "" \
