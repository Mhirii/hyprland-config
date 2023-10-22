#!/bin/fish

switch "$argv[1]"
case "neovim"
    kitty --detach --hold -e nvim
case "neovide"
    neovide --multigrid
case "lunarvim"
    kitty --detach --hold -e lvim
case "lunarvide"
    neovide --neovim-bin ~/.local/bin/lvim --multigrid
case '*'
    echo "neovim | lunarvim | neovide | lunarvide"
end

