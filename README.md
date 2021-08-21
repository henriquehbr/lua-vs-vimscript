# lua-vs-vimscript

> a **real** argument to why you should use Lua instead vimscript

## Requirements

- Any shell (preferably bash or dash for running the script)
- neovim 0.5+
- vim 8.0+

## Running the benchmark

To run the benchmark, simply run `./benchmark.sh`, the script is 100% POSIX-compliant, and tested against `dash` and `bash`

## About the tests

In short, the way it works is by running 2 neovim instances on headless mode (to avoid clearing output) and 1 vim instance, both with plugins disabled, the results are retrieved with the built-in `--startuptime` option

The test itself is a very simple loop that iterate 3 million times and it's executed 3 times, for gathering the best and the worst time from all the runs, it's implemented in vimscript, vim9script and Lua, which are executed by neovim (except by vim9script, which is executed on vim)

## Results

> Last tested: 21/08

The results below represent the worst and best (respectively) of three runs of the vimscript, vim9script, and lua configs:

- vimscript: 4965.140ms ± 4176.579ms
- vim9script: 201.764ms ± 136.847ms
- lua: 025.650ms ± 023.726ms

### Technical information

neovim version:

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

vim version:

```
VIM - Vi IMproved 8.2 (2019 Dec 12, compiled May 28 2021 06:58:52)
Included patches: 1-2891
Compiled by Arch Linux
Huge version without GUI.  Features included (+) or not (-):
+acl               -farsi             +mouse_sgr         +tag_binary
+arabic            +file_in_path      -mouse_sysmouse    -tag_old_static
+autocmd           +find_in_path      +mouse_urxvt       -tag_any_white
+autochdir         +float             +mouse_xterm       +tcl/dyn
-autoservername    +folding           +multi_byte        +termguicolors
-balloon_eval      -footer            +multi_lang        +terminal
+balloon_eval_term +fork()            -mzscheme          +terminfo
-browse            +gettext           +netbeans_intg     +termresponse
++builtin_terms    -hangul_input      +num64             +textobjects
+byte_offset       +iconv             +packages          +textprop
+channel           +insert_expand     +path_extra        +timers
+cindent           +ipv6              +perl/dyn          +title
-clientserver      +job               +persistent_undo   -toolbar
-clipboard         +jumplist          +popupwin          +user_commands
+cmdline_compl     +keymap            +postscript        +vartabs
+cmdline_hist      +lambda            +printer           +vertsplit
+cmdline_info      +langmap           +profile           +virtualedit
+comments          +libcall           +python/dyn        +visual
+conceal           +linebreak         +python3/dyn       +visualextra
+cryptv            +lispindent        +quickfix          +viminfo
+cscope            +listcmds          +reltime           +vreplace
+cursorbind        +localmap          +rightleft         +wildignore
+cursorshape       +lua/dyn           +ruby/dyn          +wildmenu
+dialog_con        +menu              +scrollbind        +windows
+diff              +mksession         +signs             +writebackup
+digraphs          +modify_fname      +smartindent       -X11
-dnd               +mouse             -sound             -xfontset
-ebcdic            -mouseshape        +spell             -xim
+emacs_tags        +mouse_dec         +startuptime       -xpm
+eval              +mouse_gpm         +statusline        -xsmp
+ex_extra          -mouse_jsbterm     -sun_workshop      -xterm_clipboard
+extra_search      +mouse_netterm     +syntax            -xterm_save
   system vimrc file: "/etc/vimrc"
     user vimrc file: "$HOME/.vimrc"
 2nd user vimrc file: "~/.vim/vimrc"
      user exrc file: "$HOME/.exrc"
       defaults file: "$VIMRUNTIME/defaults.vim"
  fall-back for $VIM: "/usr/share/vim"
Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -march=x86-64 -mtune=generic -O2 -pipe -fno-plt -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
Linking: gcc -L. -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now -fstack-protector-strong -rdynamic -Wl,-export-dynamic -Wl,-E -Wl,-rpath,/usr/lib/perl5/5.34/core_perl/CORE -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now -L/usr/local/lib -o vim -lm -ltinfo -lelf -lacl -lattr -lgpm -ldl -Wl,-E -Wl,-rpath,/usr/lib/perl5/5.34/core_perl/CORE -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now -fstack-protector-strong -L/usr/local/lib -L/usr/lib/perl5/5.34/core_perl/CORE -lperl -lpthread -ldl -lm -lcrypt -lutil -lc -L/usr/lib -ltclstub8.6 -ldl -lz -lpthread -lm
```
