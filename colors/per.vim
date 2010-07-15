" Personal colorscheme Per Juchtmans
" Based on
runtime colors/grb4.vim

" Make cursor stand out more;
hi Cursor   guifg=black     guibg=orange    gui=none    ctermfg=black   ctermbg=yellow  cterm=bold

" black background is too ... errr... black, slightly dark grey is nicer on
" the eyes.
hi Normal   guifg=#f6f3e8   guibg=#101010   gui=NONE    ctermfg=NONE    ctermbg=NONE    cterm=NONE
hi NonText  guifg=#222222   guibg=#101010   gui=NONE    ctermfg=black   ctermbg=NONE    cterm=NONE

" And so we need to make the cursorline a bit lighter or we will barely see
" it (not that I use it on a daily basis, but some plugins (NERD_tree fi.)
" rely on it.)
hi CursorLine   guifg=NONE  guibg=#222222   gui=NONE    ctermfg=NONE    ctermbg=NONE    cterm=BOLD

" Override ir_black, don't want an italic font
hi StatusLine   guifg=#CCCCCC     guibg=#202020     gui=NONE    ctermfg=white       ctermbg=darkgray    cterm=NONE

hi WildMenu       guifg=#000000     guibg=#cae682     gui=none      ctermfg=NONE        ctermbg=NONE        cterm=NONE


hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=white       ctermbg=red         cterm=NONE     guisp=#FF0000
hi ErrorMsg         guifg=white       guibg=#FF0000     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=black       guibg=#FFFF00     gui=BOLD      ctermfg=black       ctermbg=yellow         cterm=NONE


