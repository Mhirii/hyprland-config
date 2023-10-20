
#!/usr/bin/fish

if [ "$1" == "reload" ]; then
  pkill waybar;
  waybar & disown;
  sleep 0.4;
  waybar --config ~/.config/hypr/ricectl/waybar/conf/sidebar.jsonc\
    --style ~/.config/hypr/ricectl/waybar/style/sidebar.css & disown
elif [ "$1" == "start" ]; then
  waybar --config ~/.config/hypr/ricectl/waybar/conf/sidebar.jsonc\
    --style ~/.config/hypr/ricectl/waybar/style/sidebar.css & disown
elif [ "$1" == "stop" ]; then
  pkill waybar;
  waybar & disown;
else
    echo "Invalid argument. Usage: $0 [reload|start|stop]"
    exit 1
fi

