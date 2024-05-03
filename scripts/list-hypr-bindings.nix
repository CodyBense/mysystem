{ pkgs, ... }:
pkgs.writeShellScriptBin "list-hypr-bindings" ''
  yad --width=800 --height=650 \
  --center \
  --fixed \
  --title="Hyprland Keybindings" \
  --no-buttons \
  --list \
  --column=Key: \
  --column=Description: \
  --column=Command: \
  --timeout=90 \
  --timeout-indicator=right \
  " = Windows/Super" "Modifier Key, used for keybindings" "Doesn't really execute anything by itself." \
  " + T" "Terminal" "kitty" \
  " + SPACE" "Rofi App Launcher" "rofi -show drun" \
  " + Q" "Kill Focused Window" "killactive" \
  " + F" "Launch Web Browser" "firefox" \
  " + E" "Launch New File Browser Window" "thunar" \
  " + M" "Launch Spotify" "spotify" \
  " + P" "Pseudo Tiling" "pseudo" \
  " + SHIFT + I" "Toggle Split Direction" "togglesplit" \
  " + F" "Toggle Focused Fullscreen" "fullscreen" \
  " + SHIFT + F" "Toggle Focused Floating" "fullscreen" \
  " + SHIFT + DELETE" "Quit / Exit Hyprland" "exit" \
  " + Left" "Move Focus To Window On The Left" "movefocus,l" \
  " + Right" "Move Focus To Window On The Right" "movefocus,r" \
  " + Up" "Move Focus To Window On The Up" "movefocus,u" \
  " + Down" "Move Focus To Window On The Down" "movefocus,d" \
  " + SHIFT + Left" "Move Focused Window Left" "movewindow,l" \
  " + SHIFT + Right" "Move Focused Window Right" "movewindow,r" \
  " + SHIFT + Up" "Move Focused Window Up" "movewindow,u" \
  " + SHIFT + Down" "Move Focused Window Down" "movewindow,d" \
  " + H" "Move Focus To Window On The Left" "movefocus,l" \
  " + L" "Move Focus To Window On The Right" "movefocus,r" \
  " + K" "Move Focus To Window On The Up" "movefocus,u" \
  " + J" "Move Focus To Window On The Down" "movefocus,d" \
  " + SHIFT + H" "Move Focused Window Left" "movewindow,l" \
  " + SHIFT + L" "Move Focused Window Right" "movewindow,r" \
  " + SHIFT + K" "Move Focused Window Up" "movewindow,u" \
  " + SHIFT + J" "Move Focused Window Down" "movewindow,d" \
  " + S" "Toggle Special Workspace" "togglespecialworkspace" \
  " + SHIFT + S" "Send Focused Window To Special Workspace" "movetoworkspace,special" \
  " + 1-0" "Move To Workspace 1 - 10" "workspace,X" \
  " + SHIFT + 1-0" "Move Focused Window To Workspace 1 - 10" "movetoworkspace,X" \
  " + MOUSE_LEFT" "Move/Drag Window" "movewindow" \
  " + MOUSE_RIGHT" "Resize Window" "resizewindow" \
  ""
''
