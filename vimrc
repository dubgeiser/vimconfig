" ==============================================================================
" Author: Per Juchtmans <dubgeiser+vimconfig@gmail.com>
" Note: Continuously under construction
" ==============================================================================
"
" TODO organize vimrc, into `:options`
 " 1 important
 " 2 moving around, searching and patterns
 " 3 tags
 " 4 displaying text
 " 5 syntax, highlighting and spelling
 " 6 multiple windows
 " 7 multiple tab pages
 " 8 terminal
 " 9 using the mouse
" 10 GUI (put them into .gvimrc? or fold .gvimrc into .vimrc? (1 symlink less))
" 11 printing
" 12 messages and info
" 13 selecting text
" 14 editing text
" 15 tabs and indenting
" 16 folding
" 17 diff mode
" 18 mapping
" 19 reading and writing files
" 20 the swap file
" 21 command line editing
" 22 executing external commands
" 23 running make and jumping to errors
" 24 language specific
" 25 multi-byte characters
" 26 various
" 27 Auto commands (custom added by me)

" do this before anything else...
set nocompatible
au!
filetype plugin indent on

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif


" {{{1 MacVim
" Disable keymappings that MacVim adds
let macvim_skip_cmd_opt_movement = 1

" Do not load MacVim colorscheme when loading gvimrc.
let macvim_skip_colorscheme = 1

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

set undofile
set directory=~/.vim/tmp
set undodir=~/.vim/tmp

set backspace=indent,eol,start whichwrap+=<,>,[,]
set cindent

" Complete as far as possible, just complete if there's only one possibility
" and show menu if there's more than 1 possible completion.
" Show extra info if menu (preview)
set completeopt=preview,menu,longest

set display+=lastline
set encoding=utf-8
set expandtab
set fileformat=unix
set foldmethod=marker
set history=10000
set incsearch
set laststatus=2
set linespace=0

" line numbering: relative, but do show current line
set relativenumber
set number

set listchars=tab:⇒\ ,extends:»,precedes:«,trail:▒,nbsp:·
set list
set mousehide

" Ignore case sensitivity, unless a search term has capital letters in it.
set ignorecase
set smartcase

set shiftwidth=4
set showcmd
set sidescrolloff=5
set smartindent
set softtabstop=4

set statusline=%<%{functions#short_path()}%t\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

set tabstop=4

"hate the error dingdong or whatever noise.
set visualbell

set wildmenu
set wildmode=full
syntax on

set nocursorcolumn
set nocursorline
set colorcolumn=80

" {{{1 Key bindings
"===============================================================================
" Make <Leader> char something more accessible, especially  on a AZERTY keyboard
let mapleader = " "

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

" Hop from method to method.
nmap <c-n> ]]
nmap <c-p> [[

" Add open lines without going to insert mode.
nnoremap <C-CR> o<ESC>
nnoremap <C-S-CR> O<ESC>

" Jump to tag, but offer choice if multiple matches.
nnoremap <C-]> g<C-]>

" Underline current line
nnoremap <Leader>= yypVr=
nnoremap <Leader>- yypVr-

" Quick open certain files...
nnoremap <Leader>s :e ~/Documents/notes<cr>
nnoremap <Leader>r :cd ~/.vim/<cr>:e vimrc<cr>
nnoremap <Leader>d :e ~/.vim/doc/<cr>

" Less finger wrecking window navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <silent> <F5> :make<CR>

nnoremap <silent> <RIGHT> :cnext<CR>
nnoremap <silent> <RIGHT><RIGHT> :cnfile<CR><C-G>
nnoremap <silent> <LEFT> :cprev<CR>
nnoremap <silent> <LEFT><LEFT> :cpfile<CR><C-G>
nnoremap <silent> <UP><UP> :cfirst<CR>
nnoremap <silent> <DOWN><DOWN> :clast<CR>

" {{{1 Auto commands
"===============================================================================
augroup file_type_defines
    au!

    " .tpl files are mainly (x)html files, xhtml gives better omni completion.
    autocmd BufNewFile,BufRead *.tpl set filetype=xhtml

    " Twig templates are like Django templates
    autocmd BufNewFile,BufRead *.html.twig set filetype=htmldjango
augroup END

augroup file_type_settings
    au!

    " These types are fussy about tabs and spaces.
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

    autocmd FileType mail setlocal nocindent textwidth=72
    autocmd FileType text,rst setlocal nocindent
    autocmd FileType gitcommit setlocal spell nolist nocindent

    " For programming languages using a semi colon at the end of statement.
    autocmd FileType c,cc,cpp,css,java,javascript,lex,perl,php,sql,y
        \ nnoremap <silent> <Leader>; :call functions#append_semi_colon()<cr>
augroup END

augroup vim_setup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") && &ft !~# 'commit' |
        \   exe "normal g`\"" |
        \ endif

    autocmd FocusLost * silent! wall
augroup END

augroup fu_help
    au!

    " Automatically rebuild the help documentation when a vimfu file is changed.
    autocmd BufWrite *fu.txt :helptags ~/.vim/doc/
augroup END

" {{{1 Colorscheme
"===============================================================================
if !has('gui_running')
    set t_Co=256
endif
set background=light
colorscheme solarized

"{{{1 Commands for functions
"===============================================================================
command Rtrim call functions#rtrim()
command Tsquint call functions#toggle_squint_mode()
command Info call functions#buffer_info()

" {{{1 Plugin configuration
"===============================================================================
" {{{2 vim-todo
nnoremap <Leader>o :call Todo_ToggleTickbox()<cr>
vnoremap <Leader>o :call Todo_ToggleTickbox()<cr>
nnoremap <Leader>v :call Todo_TickFinished()<cr>
vnoremap <Leader>v :call Todo_TickFinished()<cr>
nnoremap <Leader>x :call Todo_TickCancelled()<cr>
vnoremap <Leader>x :call Todo_TickCancelled()<cr>

" {{{2 CTRLP
"
let g:ctrlp_max_files = 0
let g:ctrlp_map = '<leader>e'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|cache$',
  \ 'file': '\.exe$\|\.so$\|\.dll$\|^\..*\.swp$|\.pyc$',
  \ }

" {{{2 UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" {{{2 ArgWrap
nnoremap <Leader>a :ArgWrap<cr>
" {{{2 PHP Refactor
let g:php_refactor_command='php ~/bin/refactor.phar'
