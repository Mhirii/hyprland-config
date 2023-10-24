#!/bin/fish


if test "$hostname" = "desktop"
    wlogout -l ~/.config/wlogout/layout \
        --css ~/.config/wlogout/style.css \
        -b 2 -c 0 -r 0 -m 0 --protocol layer-shell
else
    wlogout -l ~/.config/wlogout/layout \
        --css ~/.config/wlogout/style_laptop.css \
        -b 2 -c 0 -r 0 -m 0 --protocol layer-shell
end

