#!/usr/bin/fish

if test -z "$argv[1]"
    echo "Please provide an argument"
    exit 1
end

set arg $argv[1]


function isRunning
    set appName $argv[1]
    if pgrep -x $appName >/dev/null
        return 0
    else
        return 1
    end
end

function getWorkspaceId
    set appName $argv[1]
    set client (hyprctl clients -j | jq ".[] | select(.initialClass == \"$appName\") | .workspace.id")
    if test -n "$client"
        echo $client
    else
        echo 9 # Return 9 to indicate that the application is not running in any workspace
    end
end

switch $arg
    case browser
        if isRunning firefox
            hyprctl dispatch workspace (getWorkspaceId "firefox")
        else
            firefox
        end

    case code
        code --password-store="gnome" \
            --ozone-platform=wayland \
            --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer

    case rofi
        rofi -show drun

    case terminal
        kitty

    case zellij
        zellij -s Main -l example
    case tmux
        kitty --detach -T tmux -e ~/.config/hypr/scripts/tmux_session.fish

    case neovim
        kitty --detach --hold -e nvim
    case neovide
        neovide --multigrid

    case lunarvim
        kitty --detach --hold -e lvim
    case lunarvide
        neovide --neovim-bin ~/.local/bin/lvim --multigrid

    case graphicalFiles
        nemo

    case files
        kitty --detach -e ranger

    case clipboard
        cliphist list | rofi -dmenu | cliphist decode | wl-copy

    case spotify
        spotify

    case spt
        spotifyd
        kitty --detach -e spt
        kitty --detach -e cava

end
