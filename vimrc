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

" Use relative line numbering, but absolute for the current line.
" 7.4 only I think.
set numberwidth=3
set relativenumber
set number

set scrolljump=1
set scrolloff=5
set shiftwidth=4
set showcmd
set smartindent
set softtabstop=4

"Default
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"set statusline=%-25.25(%<%t\ %m%r\%)%l:%c%V\ (%p%%\ of\ %L\ lines)%=%{&ff},%{strlen(&fenc)?&fenc:''}%Y
"set statusline=%-25.25(%<%t\ %m%r\%)%{&ff},%{strlen(&fenc)?&fenc:''}%Y,%L\ lines%=%l:%c%V

" Not too long or we drop to a virtual stand still when editing
" large-all-on-one-line-code (like OOo xml files.)
set synmaxcol=512

set tabstop=4

"hate the error dingdong or whatever noise.
set visualbell

set wildmenu
set wildmode=full
syntax on
set hlsearch
set nocursorcolumn
set cursorline
set colorcolumn=80


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

" NOTE: If I ever get the brilliant idea to use ctrlp for buffers:
"   There are reasons not to do it: finger muscle for instance, which is used
"   to the <TAB> key for selecting buffers, but the biggest annoyance is this:
"   When you have a vertical split and you want to load op the same buffer as
"   the one in the other window, you _can_ select that buffer, but then ctrlp
"   will jump to the other window instead of opening the buffer in the current
"   window, that's just painful.
nnoremap <Leader>b :buffers<CR>:buffer<space>

" CD to the directory the file in the current buffer is in.
nnoremap <silent> <Leader>cd :cd %:h<CR>

" Hop from method to method.
nmap <c-n> ]]
nmap <c-p> [[

" Add open lines without going to insert mode.
nnoremap <CR> o<ESC>
nnoremap <C-CR> O<ESC>

" Jump to tag, but offer choice if multiple matches.
nnoremap <C-]> g<C-]>

" TaskList
nmap <unique> <Leader>l <Plug>TaskList

" Run current defined test (see tdd.vim plugin)
nnoremap <Leader>t :call Tdd_RunTest()<cr>

" Underline current line
nnoremap <Leader>= yypVr=
nnoremap <Leader>- yypVr-

" Quick open certain files...
nnoremap <Leader>s :e ~/.notes<cr>

" So we can turn off quickly highlighted matches.
nnoremap <leader><space> :nohlsearch<cr>

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

" Automatically rebuild the help documentation when a vimfu file is changed.
autocmd BufWrite *fu.txt :helptags ~/.vim/doc/

" For programming languages using a semi colon at the end of statement.
autocmd FileType c,cc,cpp,css,java,javascript,lex,perl,php,sql,y
    \ nmap <silent> <Leader>; :call functions#append_semi_colon()<cr>

autocmd FocusLost * :wa

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml

" Twig templates are like Django templates
autocmd BufNewFile,BufRead *.html.twig set filetype=htmldjango


" {{{1 Plugin configuration
"===============================================================================
"
" {{{2 TaskList
let g:tlWindowPosition = 1
let g:tlTokenList = ['TODO', 'FIXME', 'XXX', 'HACK', '@todo', '???']

" {{{2 vim-todo
nnoremap <Leader>o :call Todo_ToggleTickbox()<cr>
vnoremap <Leader>o :call Todo_ToggleTickbox()<cr>
nnoremap <Leader>v :call Todo_TickFinished()<cr>
vnoremap <Leader>v :call Todo_TickFinished()<cr>
nnoremap <Leader>x :call Todo_TickCancelled()<cr>
vnoremap <Leader>x :call Todo_TickCancelled()<cr>

" {{{2 Airline
let g:airline_theme='solarized'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_detect_whitespace=1 "icon and message (default)
let g:airline_whitespace_symbol = 'Ξ'

" {{{2 CTRLP
let g:ctrlp_map = '<leader>e'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|cache$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|^\..*\.swp$',
  \ }

" {{{2 Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1

" {{{1 Colorscheme
"===============================================================================
set t_Co=256
"colorscheme xoria256
let g:solarized_termcolors=256
colorscheme solarized
"colorscheme perzen


"{{{1 Commands for functions
command Rtrim call functions#rtrim()
command Tsquint call functions#toggle_squint_mode()

