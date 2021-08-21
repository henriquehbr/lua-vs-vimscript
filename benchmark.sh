#!/bin/sh

# Gets the last line from 'startuptime' log, which contains the timestamp (in ms)
# of the overall time required to run nvim
get_startup_time() {
    cat results.txt | tail -1 | cut -d " " -f 1
}

# applies to both nvim and vim
common_args="--noplugin --startuptime results.txt -c q"

echo "Running nvim with Vimscript (without plugins & headless mode)"

# args because otherwise they would be treated as a single option
nvim --headless -u config.vim $common_args

vimscript_startup_time=$(get_startup_time)

echo "Running nvim with Lua (without plugins & headless mode)"

nvim --headless -u config.lua $common_args

lua_startup_time=$(get_startup_time)

echo "Running vim with vim9script (without plugins)"

vim --clean $common_args -u config-vim9.vim

vim9script_startup_time=$(get_startup_time)

rm -f results.txt

echo "vimscript startup time: ${vimscript_startup_time}ms"
echo "lua startup time: ${lua_startup_time}ms"
echo "vim9script startup time: ${vim9script_startup_time}ms"
