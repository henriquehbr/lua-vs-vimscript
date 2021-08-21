#!/bin/sh

# Gets the last line from 'startuptime' log, which contains the timestamp (in ms)
# of the overall time required to run nvim
get_startup_time() {
    cat results.txt | tail -1 | cut -d " " -f 1
}

run_test() {
    command=$@
    common_args="--noplugin --startuptime results.txt -c q"

    $command $common_args
    echo $(get_startup_time)
}

echo "Running nvim with Vimscript (without plugins & headless mode)"
vimscript_startup_time=$(run_test nvim --headless -u config.vim)

echo "Running vim with vim9script (without plugins)"
vim9script_startup_time=$(
    run_test vim \
        --not-a-term \
        --clean \
        -u config-vim9.vim
)

echo "Running nvim with Lua (without plugins & headless mode)"
lua_startup_time=$(run_test nvim --headless -u config.lua)

rm -f results.txt

echo "vimscript startup time: ${vimscript_startup_time}ms"
echo "lua startup time: ${lua_startup_time}ms"
echo "vim9script startup time: ${vim9script_startup_time}ms"
