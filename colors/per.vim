" Personal colorscheme Per Juchtmans
" Based on
runtime colors/grb4.vim

" Make cursor stand out more;
hi Cursor   guifg=black     guibg=yellow    gui=NONE    ctermfg=black   ctermbg=yellow  cterm=reverse

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
