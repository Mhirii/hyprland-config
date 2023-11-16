#!/bin/fish



set paste (wl-paste --no-newline)
if test -d $paste
    set target $paste
else if test -e $paste
    set target (dirname $paste)
end

cd $target
neovide --multigrid
