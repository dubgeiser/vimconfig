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
"   DubVim .vimrc
"   Settings are grouped like they appear in the `:options` list.
"   Plugins are added as Git sub modules into Vim's `pack` directory.
"
"
" }

" 1. Important {
    " Things that need to get done before anything else.
    au!
    filetype plugin indent on
    set rtp+=/usr/local/opt/fzf
" }
" 2. Moving around, searching and patterns {
    set ignorecase  " Ignore case sensitivity....
    set smartcase   " ... Unless there's a capital letter
" }
" 4. Displaying text {
    set nowrap
    set sidescrolloff=5
    set relativenumber
    set number
    set list
" }
" 5. Syntax, highlighting and spelling {
    let g:gruvbox_contrast_dark="hard"
    let g:gruvbox_invert_selection="0"

    " Italics in Terminal version, used for doc comments.
    let g:gruvbox_italic=1

    " Make terminal version looks as close to GUI as possible.
    " Note: works in iTerm, but not in standard Terminal.
    set termguicolors

    colorscheme gruvbox
    syntax on
    set nocursorcolumn
    set cursorline
    set colorcolumn=80
" }
" 6. Multiple windows {
    set statusline=%<%{file#ShortPath()}\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
    set winminheight=0  " Allow for fully minimized windows.
    set hidden          " Remember undo, even when buffer is not active.
    set splitbelow
    set splitright
" }
" 11. Messages and info {
    set noshowmode " Lightline plugin covers this.
    set noerrorbells
    set visualbell
" }
" 13. Editing text {
    set undofile

    " Complete as far as possible, no menu etc if there's only 1 match.
    " Show menu if there's more than 1 possible completion.
    " Show extra info if menu (preview)
    set completeopt=preview,menu,longest
" }
" 14. Tabs and indenting {
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set autoindent
" }
" 18. Reading and writing files {
    set fileformat=unix
    set autowrite
" }
" 19. The swap file {
" }
" 20. Command line editing {
    set wildmode=full
    set wildignorecase  " Ignore case on the command line.
    set cmdwinheight=12
" }
