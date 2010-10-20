"winpos 0 0
set lines=48
set columns=96
"colorscheme zenburn
"colorscheme per
colorscheme mayansmoke
" no menu
set guioptions-=m
" no toolbar
set guioptions-=T
" no scrollbars
set guioptions-=l
set guioptions-=r

set nocursorcolumn
set nocursorline

if !has("unix")
    " ProggyClean does not look too good on my Ubuntu
    set guifont=ProggyClean
    " For CTRL-V to work autoselect must be off.
    " On Unix we have two selections, autoselect can be used.
    set guioptions-=a
elseif has("gui_macvim")
    " Take up all the space when running full screen MacVim
    set fuoptions=maxvert,maxhorz

    "http://nodnod.net/2009/feb/12/adding-straight-single-and-double-quotes-inconsola/
    set guifont=Inconsolata-dz:h14
    set antialias

    "set guifont=Monaco:h14
    "set noantialias
else
    set guifont=Monospace\ 10
endif

