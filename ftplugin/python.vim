" This is the recommended setting for Python:
" Spaces instead of tabs and 4 spaces for 1 TAB
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4

nnoremap <leader>f /def\s*

" pyflakes is required, using python will cause scripts to execute and will
" also dump a bunch of import errors on django projects if DJANGO environment
" variable is not set.
if executable("pyflakes")
    set makeprg=pyflakes\ %
    set errorformat+=%E%f:%l:\ could\ not\ compile,%-Z%p^,%W%f:%l:\ %m,%-G%.%#
endif

" Error format and Tdd_makeprg for tdd.vim
set errorformat+=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
let g:Tdd_makeprg='python'

