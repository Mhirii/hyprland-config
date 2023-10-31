#!/usr/bin/fish
# Assign the wallpaper path to a variable
set wallpaper_path $argv[1]

# Check if the specified wallpaper file exists
if not test -f $wallpaper_path
    echo "Error: Wallpaper file does not exist."
    exit 1
end

# Run the 'wal' command with the specified options and wallpaper path
echo $wallpaper_path;
wal -n -t -s -e --backend wal -i $wallpaper_path
ln -sf  ~/.cache/wal/colors-waybar.css ~/.config/waybar/theme.css
pkill waybar;
waybar & disown;
