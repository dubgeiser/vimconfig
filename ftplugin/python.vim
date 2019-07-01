" DubVim - modeline, notes, info, ... {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"
"                     _____         _   _    _ _
"                    (____ \       | | | |  | (_)
"                     _   \ \ _   _| | | |  | |_ ____
"                    | |   | | | | | || \ \/ /| |    \
"                    | |__/ /| |_| | |_) )  / | | | | |
"                    |_____/  \____|____/ \/  |_|_|_|_|
"
"               Per Juchtmans <dubgeiser+vimconfig@gmail.com>
"
"   DubVim Python specific config.
"
"
" }

" This is the recommended setting for Python:
" Spaces instead of tabs and 4 spaces for 1 TAB
set shiftwidth=4
set tabstop=4
set expandtab

nnoremap <leader>f /def\s*
set errorformat+=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" pyflakes is required, using python will cause scripts to execute and will
" also dump a bunch of import errors on django projects if DJANGO environment
" variable is not set.
if executable("pyflakes")
    set makeprg=pyflakes\ %
    set errorformat+=%E%f:%l:\ could\ not\ compile,%-Z%p^,%W%f:%l:\ %m,%-G%.%#
endif
