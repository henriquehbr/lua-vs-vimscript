#!/bin/sh

# Gets the last line from 'startuptime' log, which contains the
# timestamp (in ms) of the overall time required to run nvim
get_startup_time() {
    cat results.txt | tail -1 | cut -d " " -f 1
}

run_test() {
    command=$@
    common_args="--noplugin --startuptime results.txt -c q"

    iterations=0
    best_time=
    worst_time=
    while [ $iterations -le 2 ]; do
        $command $common_args

        startup_time="$(get_startup_time)"
        if [ -z "$best_time" ] || [ "${startup_time%%.*}" -lt "${best_time%%.*}" ]; then
            best_time="$startup_time"
        elif [ -z "$worst_time" ] || [ "${startup_time%%.*}" -gt "${worst_time%%.*}" ]; then
            worst_time="$startup_time"
        fi

        iterations=$(( iterations + 1 ))
    done
    echo "${worst_time}ms ± ${best_time}ms"
}


echo "Running vim with vim9script (without plugins)"
vim9script_startup_time=$(run_test vim --not-a-term --clean -u config-vim9.vim)

echo "Running vim with Lua (without plugins)"
vim_lua_startup_time=$(run_test vim --not-a-term --clean --cmd luafile./config.lua)

echo "Running nvim with Vimscript (without plugins & headless mode)"
vimscript_startup_time=$(run_test nvim --headless -u config.vim)

echo "Running nvim with Lua (without plugins & headless mode)"
lua_startup_time=$(run_test nvim --headless -u config.lua)

echo
echo "vim vim9script startup time: ${vim9script_startup_time}"
echo "vim lua startup time: ${vim_lua_startup_time}"
echo "nvim vimscript startup time: ${vimscript_startup_time}"
echo "nvim lua startup time: ${lua_startup_time}"
