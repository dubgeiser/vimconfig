" Personal colorscheme Per Juchtmans
" Based on
runtime colors/zenburn.vim

" Make cursor stand out more;
hi Cursor   guifg=black     guibg=orange    gui=none    ctermfg=black   ctermbg=yellow  cterm=bold

" And so we need to make the cursorline a bit lighter or we will barely see
" it (not that I use it on a daily basis, but some plugins (NERD_tree fi.)
" rely on it.)
hi CursorLine   guifg=NONE  guibg=#333333   gui=NONE    ctermfg=NONE    ctermbg=NONE    cterm=BOLD

" Make warnings and errors stand out more
hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=white       ctermbg=red         cterm=NONE     guisp=#FF0000
hi ErrorMsg         guifg=white       guibg=#FF0000     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=black       guibg=#FFFF00     gui=BOLD      ctermfg=black       ctermbg=yellow         cterm=NONE

