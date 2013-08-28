"
" Personalisation of Zenburn colorscheme.
"
runtime colors/zenburn.vim

" Overwrite, or g:colors_name will still be 'zenburn', causing possible
" confusion in various custom scripts/functions.
let g:colors_name = "perzen"

hi Cursor   guifg=black     guibg=orange    gui=none    ctermfg=black   ctermbg=yellow  cterm=bold

hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=white       ctermbg=red         cterm=NONE     guisp=#FF0000
hi ErrorMsg         guifg=white       guibg=#FF0000     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=black       guibg=#FFFF00     gui=BOLD      ctermfg=black       ctermbg=yellow      cterm=NONE

hi IncSearch        guifg=black       guibg=yellow      gui=BOLD      ctermfg=black       ctermbg=yellow      cterm=NONE
hi Search           guifg=black       guibg=yellow      gui=BOLD      ctermfg=black       ctermbg=yellow      cterm=NONE
