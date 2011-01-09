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
" Copied from _vimrc file upon installation of vim 7
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" If there isn't one, append a semi colon to the end of the current line.
function s:appendSemiColon()
    if getline('.') !~ ';$'
        let save_cursor = getpos('.')
        exec("s/$/;/")
        call setpos('.', save_cursor)
    endif
endfunction


" {{{1 pathogen
" Apparently, we need to execute pathogen before filetype detection.
" http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
call pathogen#runtime_append_all_bundles() 
call pathogen#helptags()
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

set diffexpr=MyDiff()
set encoding=utf-8
set expandtab
set fileformat=unix
set foldclose=all
set foldmethod=marker
set history=500
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
set statusline=%-32.32(%<%f\ %r\ %m\%)\ Ln:\ %l/%L,\ Col:\ %c%=%{&ff}\ %{strlen(&fenc)?&fenc:''}\ %Y\ 

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


" {{{1 Key bindings
"===============================================================================
" Make <Leader> char something more accessible on a AZERTY keyboard
let mapleader = ","
let g:mapleader = ","

" Easier omni-complete keys
inoremap <c-space> <c-x><c-o>
inoremap <c-d> <c-x><c-f>

" Easier accesible word deletion when typing, also in command
imap <c-h> <c-w>
cmap <c-h> <c-w>

" Do not exit visual mode when shifting
vnoremap > >gv
vnoremap < <gv

nnoremap <Leader>b :buffers<CR>:buffer 
nnoremap <Leader>e :e <C-D>

" Todolists
nmap <Leader>o :call Todo_ToggleTickbox()<cr>
vmap <Leader>o :call Todo_ToggleTickbox()<cr>
nmap <Leader>v :call Todo_TickFinished()<cr>
vmap <Leader>v :call Todo_TickFinished()<cr>
nmap <Leader>x :call Todo_TickCancelled()<cr>
vmap <Leader>x :call Todo_TickCancelled()<cr>

" CD to the directory the file in the current buffer is in.
nmap <silent> <Leader>cd :cd %:h<CR>
" ... same thing, but for the current window only.
"nmap <silent> <Leader>lcd :lcd %:h<CR>

" Hop from method to method.
nmap <c-j> ]]
nmap <c-k> [[

" Add open lines without going to insert mode.
nmap <C-Enter> o<ESC>
nmap <C-S-Enter> O<ESC>

" TaskList
nmap <unique> <Leader>l <Plug>TaskList

" Run current buffer as test for tdd.vim
nmap <Leader>t :call Tdd_RunTestFile('%')<cr>

" Underline current line
nnoremap <Leader>= yypVr=
nnoremap <Leader>- yypVr-

" Shortcut to open my gtd inbox
nnoremap <Leader>i :e ~/gtd/inbox.rst<cr>

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




" {{{1 Plugin configuration
"===============================================================================
"
" {{{2 SnipMate
let g:snips_author = "P. Juchtmans"

" {{{2 TagList
" http://vim-taglist.sourceforge.net/extend.html
let Tlist_Sort_Type = "name"
let Tlist_Exit_OnlyWindow = 0
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 45
let Tlist_Compact_Format = 1

" {{{2 TaskList
let g:tlWindowPosition = 1
let g:tlTokenList = ['TODO', 'FIXME', 'XXX', 'HACK', '@todo', '???']

