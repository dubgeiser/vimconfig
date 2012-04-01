" ==============================================================================
" Author: P. Juchtmans
" Note: Continuously under construction
" ==============================================================================

" do this before anything else...
set nocompatible
au!

" Better % matching.  Note that this comes from vim install and might need to
" be updated if Vim is updated.  This includes the doc file macros/matchit.txt
" and running the :helptags command afterwards.
runtime macros/matchit.vim


" {{{1 pathogen
" Apparently, we need to execute pathogen before filetype detection.
" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
call pathogen#infect()
filetype plugin indent on


" {{{1 Abbreviations and typo's
" Compensate for the FUCKING Mac AZERTY BE layout, for instance: typing "|| "
" fast will result in the trailing char to be char 160 instead of 32.
inoremap   <Space>

" {{{1 Settings
"===============================================================================
set autoindent
set autoread

" Remember undo's even when buffer has been in the background.
" Also allows for sending buffers to the background without saving...
set hidden
" ... this is where this comes in:
set autowrite

set backspace=indent,eol,start whichwrap+=<,>,[,]
set cindent

" Complete as far as possible, just complete if there's only one possibility
" and show menu if there's more than 1 possible completion.
" Show extra info if menu (preview)
set completeopt=preview,menu,longest

set encoding=utf-8
set expandtab
set fileformat=unix
set foldclose=all
set foldmethod=marker
set history=1000
set incsearch
set laststatus=2
set linespace=0
set mousehide
set nobackup

" Ignore case sensitivity, unless a search term has capital letters in it.
set ignorecase
set smartcase

set nonumber
set scrolljump=1
set scrolloff=5
set shiftwidth=4
set showcmd
set smartindent
set softtabstop=4

"Default
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline=%-25.25(%<%t\ %m%r\%)line\ %l\ of\ %L\ col\ %c%V\ (%p%%)%=%{&ff},%{strlen(&fenc)?&fenc:''}%Y\ 

" Not too long or we drop to a virtual stand still when editing
" large-all-on-one-line-code (like OOo xml files.)
set synmaxcol=512

set tabstop=4

"hate the error dingdong or whatever noise.
set visualbell

set wildmenu
set wildmode=full
syntax on
set nohlsearch
set nocursorcolumn
set cursorline


" {{{1 Key bindings
"===============================================================================
" Make <Leader> char something more accessible on a AZERTY keyboard
let mapleader = ","
let g:mapleader = ","

" Easier omni-complete keys
inoremap <c-space> <c-x><c-o>
inoremap <c-d> <c-x><c-f>

" Do not exit visual mode when shifting
vnoremap > >gv
vnoremap < <gv

nnoremap <Leader>b :buffers<CR>:buffer 
nnoremap <Leader>e :e ./**/

" CD to the directory the file in the current buffer is in.
nmap <silent> <Leader>cd :cd %:h<CR>

" Hop from method to method.
nmap <c-n> ]]
nmap <c-p> [[

" Add open lines without going to insert mode.
nmap <CR> o<ESC>
nmap <C-CR> O<ESC>

" Jump to tag, but offer choice if multiple matches.
nmap <C-]> g<C-]>

" TaskList
nmap <unique> <Leader>l <Plug>TaskList

" Run current defined test (see tdd.vim plugin)
nmap <Leader>t :call Tdd_RunTest()<cr>

" Underline current line
nnoremap <Leader>= yypVr=
nnoremap <Leader>- yypVr-

" Quick open certain files...
nnoremap <Leader>i :e ~/gtd/inbox.rst<cr>
nnoremap <Leader>s :e ~/.scratchbuffer<cr>

" Less finger wrecking window navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <silent> <F5> :make<CR>


" {{{1 Auto commands
"===============================================================================
autocmd FileType mail setlocal nocindent textwidth=72
autocmd FileType text,rst,gitcommit setlocal nocindent

" These types are fussy about tabs and spaces.
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" Automatically rebuild the help documentation when vimfu file is changed.
autocmd BufWrite *fu.txt :helptags ~/.vim/doc/

" For programming languages using a semi colon at the end of statement.
autocmd FileType c,cc,cpp,css,java,javascript,lex,perl,php,sql,y
    \ nmap <silent> <Leader>; :call functions#append_semi_colon()<cr>

autocmd FocusLost * :wa

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml


" {{{1 Plugin configuration
"===============================================================================
"
" {{{2 TaskList
let g:tlWindowPosition = 1
let g:tlTokenList = ['TODO', 'FIXME', 'XXX', 'HACK', '@todo', '???']

" {{{2 vim-todo
nmap <Leader>o :call Todo_ToggleTickbox()<cr>
vmap <Leader>o :call Todo_ToggleTickbox()<cr>
nmap <Leader>v :call Todo_TickFinished()<cr>
vmap <Leader>v :call Todo_TickFinished()<cr>
nmap <Leader>x :call Todo_TickCancelled()<cr>
vmap <Leader>x :call Todo_TickCancelled()<cr>

" {{{2 Powerline
let g:Powerline_symbols='compatible'
let g:Powerline_stl_path_style='short'
call Pl#Theme#RemoveSegment('mode_indicator')
call Pl#Theme#RemoveSegment('scrollpercent')
call Pl#Theme#InsertSegment('ws_marker', 'before', 'fileinfo')


" {{{1 Colorscheme
"===============================================================================
set t_Co=256
colorscheme perzen


"{{{1 Commands for functions
command Rtrim call functions#rtrim()

