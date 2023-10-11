#!/bin/fish

swww init &

sleep1;
~/.config/hypr/ricectl/wall/wallctl next

sleep 1;
megasync & disown;
/home/mhiri/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize & disown;

