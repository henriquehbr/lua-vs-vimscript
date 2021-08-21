# lua-vs-vimscript

> a **real** argument to why you should use Lua instead vimscript

## Requirements

- Any shell (preferably bash or dash for running the script)
- nvim 0.5+

## Running the benchmark

To run the benchmark, simply run `./benchmark.sh`, the script is 100% POSIX-compliant, and tested against `dash` and `bash`

## About the tests

In short, the way it works is by running to nvim twice, both instances on headless mode (to avoid clearing output) and without loading plugins, the results are retrieved with the built-in `--startuptime` nvim option

The test itself is a very simple loop that iterate 3 million times, it's implemented in both Vimscript and Lua, which in it's turn, is ran by the two spawned nvim instances (respectively)

## Results

> Last tested: 24/07

The results below represent the best and worse (respectively) of three runs of both the Lua and the Vimscript config

- Lua: 0.18ms - 0.22ms
- Vimscript: 3.9s - 4s

### Technical information

```
NVIM v0.5.0
Build type: Release
LuaJIT 2.0.5
Compilation: /usr/bin/cc -D_FORTIFY_SOURCE=2 -march=x86-64 -mtune=generic -O2 -pipe -fno-plt -U_FORTIFY_SOUR
-D_FORTIFY_SOURCE=1 -DNVIM_TS_HAS_SET_MATCH_LIMIT -O2 -DNDEBUG -Wall -Wextra -pedantic -Wno-unused-parameter
strict-prototypes -std=gnu99 -Wshadow -Wconversion -Wmissing-prototypes -Wimplicit-fallthrough -Wvla -fstack
otector-strong -fno-common -fdiagnostics-color=always -DINCLUDE_GENERATED_DECLARATIONS -D_GNU_SOURCE -DNVIM_
PACK_HAS_FLOAT32 -DNVIM_UNIBI_HAS_VAR_FROM -DMIN_LOG_LEVEL=3 -I/build/neovim/src/neovim-0.5.0/build/config -
uild/neovim/src/neovim-0.5.0/src -I/usr/include -I/build/neovim/src/neovim-0.5.0/build/src/nvim/auto -I/buil
eovim/src/neovim-0.5.0/build/include
Compiled by builduser
```
