#!/bin/fish

if test (tmux ls)
  tmux a
else
  tmux new-session -s tmux1
end
