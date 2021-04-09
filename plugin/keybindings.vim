" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" Compensate for the FUCKING Mac AZERTY BE layout, for instance:
" typing "|| " fast will result in the trailing char to be char 160
" instead of 32 due to not yet having released cmd/option keys.
inoremap   <Space>

" Make <Leader> char something more accessible, especially  on AZERTY.
let mapleader = " "

" Make Y behave consistently with D and C in all modes
noremap Y y$

" Jump to tag, but offer choice if multiple matches.
nnoremap <C-]> g<C-]>

" Underline current line
nnoremap <Leader>= yypVr=
nnoremap <Leader>- yypVr-

" Quick open certain files...
nnoremap <Leader>s :e ~/Documents/notes<CR>

" Less finger wrecking window navigation.
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" I don't use `:terminal` a lot, but when I do, I forget how to escape.
tnoremap <Esc> <C-\><C-n>

" Have some use for the arrow keys.
" Allows for quick browsing through search results and errors and the likes in
" the quickfix window.
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <S-Down> :cnfile<CR><C-G>
nnoremap <silent> <Up> :cprev<CR>
nnoremap <silent> <S-Up> :cpfile<CR><C-G>
nnoremap <silent> <Left> :cfirst<CR>
nnoremap <silent> <Right> :clast<CR>

nnoremap <Leader>q :quit<CR>
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>w :call buffer#ToggleLineWrap()<CR>
