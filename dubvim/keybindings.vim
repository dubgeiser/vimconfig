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

" Easier omni-complete keys
inoremap <C-Space> <C-X><C-O>

" <C-Space> does not seem to work in CLI vim, Terminal and iTerm2 apps
" interpret it as <C-@>.
if !has('nvim') && !has('gui_running') && has('unix')
    inoremap <C-@> <C-X><C-O>
endif
inoremap <C-D> <C-X><C-F>

" Commands like :Buffers and :Files are provided by the FZF plugin.
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>e :Files<CR>
nnoremap <Leader>h :History<CR>
nnoremap <Leader>/ :BLines<CR>

" Add open lines without going to insert mode.
nnoremap <C-CR> o<ESC>
nnoremap <C-S-CR> O<ESC>

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

nnoremap <silent> <Right> :cnext<CR>
nnoremap <silent> <Right><Right> :cnfile<CR><C-G>
nnoremap <silent> <Left> :cprev<CR>
nnoremap <silent> <Left><Left> :cpfile<CR><C-G>
nnoremap <silent> <Up><Up> :cfirst<CR>
nnoremap <silent> <Down><Down> :clast<CR>

nnoremap <Leader>q :quit<CR>
nnoremap <Leader><Leader> <C-^>

" :Gstatus is provided by the Fugitive plugin.
nnoremap <Leader>g :Gstatus<CR>
