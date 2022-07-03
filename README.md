# Important notice

This project is currently hosted on GitHub. This is not ideal; GitHub is a proprietary,
trade-secret system that is not Free and Open Souce Software (FOSS). I'm deeply
concerned about using a proprietary system like GitHub to develop our FOSS project.
I urge you to read about the [Give up GitHub](https://GiveUpGitHub.org) campaign
from [the Software Freedom Conservancy](https://sfconservancy.org) to understand
some of the reasons why GitHub is not a good place to host FOSS projects.

With that in mind, i'll be migrating this repository to sourcehut on **August 1st**,
after that, with the intent of keeping users and contributors informed, this repository
will be archived, and all of it's files and commit history will be removed (with
the exception of this notice), keep in mind that development will happen exclusively
at sourcehut

Any use of this project's code by GitHub Copilot, past or present, is done
without my permission. I do not consent to GitHub's use of this project's
code in Copilot.

![Logo of the GiveUpGitHub campaign](https://sfconservancy.org/img/GiveUpGitHub.png)

# lua-vs-vimscript

> a **real** argument to why you should use Lua instead vimscript

## Requirements

- Any shell (preferably bash or dash for running the script)
- neovim 0.6+
- vim 8.0+

## Running the benchmark

To run the benchmark, simply run `./benchmark.sh`, the script is 100% POSIX-compliant, and tested against `dash` and `bash`

## About the tests

In short, the way it works is by running 2 neovim instances on headless mode (to avoid clearing output) and 2 vim instances, both with plugins disabled, the results are retrieved with the built-in `--startuptime` option

The test itself is a very simple loop that iterate 3 million times and it's executed 3 times, for gathering the best and the worst time from all the runs, it's implemented in vimscript, vim9script and Lua, which are executed on both neovim and vim (except by vim9script, which is executed only on vim)

## Results

> Last tested: 17/12/2021

The results below represent the worst and best (respectively) of three runs of the vimscript, vim9script, and lua configs:

- vimscript (nvim): 4085.615ms ± 4040.756ms
- vim9script: 117.148ms ± 110.461ms
- lua (vim): 027.592ms ± 027.881ms
- lua (nvim): 012.506ms ± 012.445ms

### Technical information

neovim version:

```
NVIM v0.6.0
Build type: Release
LuaJIT 2.0.5
```

vim version:

```
VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Dec 02 2021 19:44:33)
Included patches: 1-3582, 3602
Compiled by Arch Linux
Huge version without GUI.  Features included (+) or not (-):
+acl               +file_in_path      +mouse_urxvt       -tag_any_white
+arabic            +find_in_path      +mouse_xterm       +tcl/dyn
+autocmd           +float             +multi_byte        +termguicolors
+autochdir         +folding           +multi_lang        +terminal
-autoservername    -footer            -mzscheme          +terminfo
-balloon_eval      +fork()            +netbeans_intg     +termresponse
+balloon_eval_term +gettext           +num64             +textobjects
-browse            -hangul_input      +packages          +textprop
++builtin_terms    +iconv             +path_extra        +timers
+byte_offset       +insert_expand     +perl/dyn          +title
+channel           +ipv6              +persistent_undo   -toolbar
+cindent           +job               +popupwin          +user_commands
-clientserver      +jumplist          +postscript        +vartabs
-clipboard         +keymap            +printer           +vertsplit
+cmdline_compl     +lambda            +profile           +virtualedit
+cmdline_hist      +langmap           +python/dyn        +visual
+cmdline_info      +libcall           +python3/dyn       +visualextra
+comments          +linebreak         +quickfix          +viminfo
+conceal           +lispindent        +reltime           +vreplace
+cryptv            +listcmds          +rightleft         +wildgnore
+cscope            +localmap          +ruby/dyn          +wildmenu
+cursorbind        +lua/dyn           +scrollbind        +windows
+cursorshape       +menu              +signs             +writebackup
+dialog_con        +mksession         +smartindent       -X11
+diff              +modify_fname      -sodium            -xfontset
+digraphs          +mouse             -sound             -xim
-dnd               -mouseshape        +spell             -xpm
-ebcdic            +mouse_dec         +startuptime       -xsmp
+emacs_tags        +mouse_gpm         +statusline        -xterm_clipboard
+eval              -mouse_jsbterm     -sun_workshop      -xterm_save
+ex_extra          +mouse_netterm     +syntax
+extra_search      +mouse_sgr         +tag_binary
-farsi             -mouse_sysmouse    -tag_old_static
   system vimrc file: "/etc/vimrc"
     user vimrc file: "$HOME/.vimrc"
 2nd user vimrc file: "~/.vim/vimrc"
      user exrc file: "$HOME/.exrc"
       defaults file: "$VIMRUNTIME/defaults.vim"
  fall-back for $VIM: "/usr/share/vim"
Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -march=x86-64 -mtune=generic -O2 -pipe -fno-plt -D_REENTRANT -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
Linking: gcc -L. -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now -fstack-protector-strong -rdynamic -Wl,-export-dynamic -Wl,-E -Wl,-rpath,/usr/lib/perl5/5.34/core_perl/CORE -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now -L/usr/local/lib -o vim -lm -ltinfo -lelf -lacl -lattr -lgpm -ldl -Wl,-E -Wl,-rpath,/usr/lib/perl5/5.34/core_perl/CORE -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now -fstack-protector-strong -L/usr/local/lib -L/usr/lib/perl5/5.34/core_perl/CORE -lperl -lpthread -ldl -lm -lcrypt -lutil -lc -L/usr/lib -ltclstub8.6 -ldl -lz -lpthread -lmi
```
