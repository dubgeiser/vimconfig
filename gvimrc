" no menu
set guioptions-=m

" no toolbar
set guioptions-=T

" no scrollbars
set guioptions-=l
set guioptions-=r
set guioptions-=L

" Use :ex instead of gui modal dialogs.
set guioptions+=c

if !has("unix")
    " ProggyClean does not look too good on my Ubuntu
    set guifont=ProggyClean
    " For CTRL-V to work autoselect must be off.
    " On Unix we have two selections, autoselect can be used.
    set guioptions-=a
elseif has("gui_macvim")
    " Take up all the space when running full screen MacVim
    set fuoptions=maxvert,maxhorz

    set guifont=Inconsolata\ Regular:h18
    set antialias
else
    set guifont=Monospace\ 10
endif

set linespace=0
