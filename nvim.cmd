@echo off
wsl wslpath "%1" > tmpfile
set /p filepath= < tmpfile
del tmpfile
wsl nvim --server "/tmp/godot.pipe" --remote-send "<esc>:n %filepath%<CR>:call cursor(%2,%3)<CR>"
