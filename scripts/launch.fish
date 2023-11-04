#!/usr/bin/fish

if test -z "$argv[1]"
  echo "Please provide an argument"
  exit 1
end

set arg $argv[1]


function isRunning
    set appName $argv[1]
    if pgrep -x $appName > /dev/null
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
        echo "9"  # Return 9 to indicate that the application is not running in any workspace
    end
end

switch $arg
  case "browser"
    if isRunning "firefox"
      hyprctl dispatch workspace (getWorkspaceId "firefox")
    else
      firefox
    end
      
  case "code"
    code --password-store="gnome" \
      --ozone-platform=wayland \
      --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer
  case "terminal"
    kitty
  case "neovide"
    neovide
  case "graphicalFiles"
    nemo
  case "files"
    kitty --detach -e "ranger"
end
