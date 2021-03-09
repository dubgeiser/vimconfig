" DubVim - modeline, notes, info, ... {
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
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
"   DubVim Key Bindings
"   Note that keyboard mappings that need a plugin to function properly will
"   be added to plugin/plugconfig.vim rather than here.
" }

" Compensate for the FUCKING Mac AZERTY BE layout, for instance:
" typing "|| " fast will result in the trailing char to be char 160
" instead of 32 due to not yet having released cmd/option keys.
inoremap   <Space>

" Make <Leader> char something more accessible, especially  on AZERTY.
let mapleader = " "

" Make Y behave consistently with D and C in all modes
noremap Y y$

" I don't use 'K' and the times that I hit it unintentionally, it has only
" caused distraction in editing... No more.
noremap K <Nop>

" Add open lines without going to insert mode.
nnoremap <CR> o<ESC>
nnoremap <S-CR> O<Esc>

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
