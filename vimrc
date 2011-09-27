" ==============================================================================
" Description: vimrc configuration
"              This should be svn co'd in the directory ~/.vim
"              From ~/.vimrc source this file:
"
"                   source ~/.vim/vimrc
"
"              Or make ~/.vimrc a symlink
"
" Author: P. Juchtmans
" Note: Still needs some cleaning up.
" ==============================================================================

" do this before anything else...
set nocompatible
au!

" Better % matching.  Note that this comes from vim install and might need to
" be updated if Vim is updated.  This includes the doc file macros/matchit.txt
" and running the :helptags command afterwards.
runtime macros/matchit.vim

" {{{1 Functions
"===============================================================================

" If there isn't one, append a semi colon to the end of the current line.
function s:appendSemiColon()
    if getline('.') !~ ';$'
        let save_cursor = getpos('.')
        exec("s/$/;/")
        call setpos('.', save_cursor)
    endif
endfunction


" Remove trailing whitespace current buffer from trailing whitespace.
fun s:rtrim()
    exec('%s/\s\+$//e')
endf


" Toggle between dark / light colorschemes.
" depends on 3 configuration variables being set
" (in ~/.vimcolorscheme)
"
" - g:light_colorscheme     The name of the 'light' colorscheme
" - g:dark_colorscheme      The name of the 'dark' colorscheme
" - g:colorscheme_mode      Which colorscheme mode ('light' or 'dark') to
"                           start in.
" Example:
" let g:light_colorscheme = 'newspaper'
" let g:dark_colorscheme = 'zenburn'
" let g:colorscheme_mode = 'dark'
" Will start with zenburn colorscheme, when toggleColorScheme() is called,
" will set the background to 'light' and use g:light_colorscheme.
"
" Note:
" There is a command 'C' mapped to this function
" (see the section 'Further initialization')
fun! s:toggleColorScheme()
    if !exists('g:colorscheme_mode')
        return
    endif
    let light_or_dark = g:colorscheme_mode
    let colorscheme = eval('g:' . light_or_dark . '_colorscheme')
    exec('set background=' . light_or_dark)
    exec('colorscheme ' . colorscheme)
    let g:colorscheme_mode = light_or_dark == 'dark' ? 'light' : 'dark'
endf



" {{{1 pathogen
" Apparently, we need to execute pathogen before filetype detection.
" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
call pathogen#infect() 
filetype plugin indent on



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
" no longer necessary with custom statusline.
"set ruler
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

" Which color scheme to use is not under version control so that it doesn't
" bother anyone if I choose to switch color schemes.
source ~/.vimcolorscheme

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

" Use Perl/Python/egrep regex when searching
" 2011-08-30
"   In 'PHP' programming, this makes searching for vars in various forms rather
"   cumbersome, fi. both '$' and '>' need to be escaped.  After a couple days
"   of use have to conclude that this mapping is of little to no use.
"nmap / /\v

" Easier accesible word deletion when typing, also in command
imap <c-h> <c-w>
cmap <c-h> <c-w>

" Do not exit visual mode when shifting
vnoremap > >gv
vnoremap < <gv

nnoremap <Leader>b :buffers<CR>:buffer 
nnoremap <Leader>e :e ./**/
"nnoremap <Leader>e :e <C-D>

" CD to the directory the file in the current buffer is in.
nmap <silent> <Leader>cd :cd %:h<CR>
" ... same thing, but for the current window only.
"nmap <silent> <Leader>lcd :lcd %:h<CR>

" Hop from method to method.
nmap <c-n> ]]
nmap <c-p> [[

" Add open lines without going to insert mode.
nmap <CR> o<ESC>
nmap <C-CR> O<ESC>

" TaskList
nmap <unique> <Leader>l <Plug>TaskList

" Run current defined test (see tdd.vim plugin)
nmap <Leader>t :call Tdd_RunTest()<cr>

" Underline current line
nnoremap <Leader>= yypVr=
nnoremap <Leader>- yypVr-

" Shortcut to open my gtd inbox
nnoremap <Leader>i :e ~/gtd/inbox.rst<cr>

" Less finger wrecking window navigation.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l


" {{{2 Function keys
nnoremap <silent> <F5> :make<CR>
nnoremap <silent> <F6> :TlistToggle<CR>


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
autocmd BufWrite vimfu.txt :helptags ~/.vim/doc/

" For programming languages using a semi colon at the end of statement.
autocmd FileType c,cc,cpp,css,java,javascript,lex,perl,php,sql,y
    \ nmap <silent> <Leader>; :call <SID>appendSemiColon()<cr>

autocmd FocusLost * :wa

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml




" {{{1 Plugin configuration
"===============================================================================
"
" {{{2 SnipMate
let g:snips_author = "P. Juchtmans"

" {{{2 TagList
" http://vim-taglist.sourceforge.net/extend.html
let Tlist_Close_On_Select = 1
let Tlist_Compact_Format = 1
let Tlist_Display_Prototype = 1
let Tlist_Exit_OnlyWindow = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 45

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


"{{{1 Further initialization
command C call <SID>toggleColorScheme()
:C
command Rtrim call <SID>rtrim()

