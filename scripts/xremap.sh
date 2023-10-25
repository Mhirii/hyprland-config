#!/bin/fish

kitty -e \
  sudo xremap /home/mhiri/.config/xremap/config.yml &
sleep 0.2;

hyprctl dispatch movetoworkspace special
