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
    set nocompatible
    au!
    filetype plugin indent on
    set rtp+=/usr/local/opt/fzf
" }
" 2. Moving around, searching and patterns {
    set incsearch
    set ignorecase  " Ignore case sensitivity....
    set smartcase   " ... Unless there's a capital letter
" }
" 4. Displaying text {
    set nowrap
    set sidescrolloff=5
    set display+=lastline
    set relativenumber
    set number
    set list
    set listchars=tab:⇒\ ,extends:»,precedes:«,trail:▒,nbsp:·
" }
" 5. Syntax, highlighting and spelling {
    let g:gruvbox_contrast_dark="medium"
    let g:gruvbox_contrast_light="medium"
    let g:gruvbox_invert_selection="0"
    set background=dark
    colorscheme gruvbox
    syntax on
    set nocursorcolumn
    set cursorline
    set colorcolumn=80
" }
" 6. Multiple windows {
    set laststatus=2
    set statusline=%<%{file#ShortPath()}\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
    set winminheight=0  " Allow for fully minimized windows.
    set hidden          " Remember undo, even when buffer is not active.
    set splitbelow
    set splitright
" }
" 10. GUI {
    if has('gui_running')
        " no menu, no toolbar, no scrollbars
        set guioptions-=m
        set guioptions-=T
        set guioptions-=l
        set guioptions-=r
        set guioptions-=L

        " Use :ex instead of gui modal dialogs.
        " This is kinda borked on MacVim which goes to great length to present
        " you a modal dialog.
        set guioptions+=c

        if has('linux')
            set guifont=IBM\ Plex\ Mono\ Light\ 12
        else
            set guifont=IBMPlexMono-Light:h16
        endif
        set linespace=0
    endif
" }
" 12. Messages and info {
    set showcmd
    set noshowmode " Lightline plugin covers this.
    set noerrorbells
    set visualbell
" }
" 14. Editing text {
    set undofile
    set undodir=~/.vim/tmp
    set backspace=indent,eol,start whichwrap+=<,>,[,]

    " Complete as far as possible, no menu etc if there's only 1 match.
    " Show menu if there's more than 1 possible completion.
    " Show extra info if menu (preview)
    set completeopt=preview,menu,longest
" }
" 15. Tabs and indenting {
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set autoindent
" }
" 19. Reading and writing files {
    set fileformat=unix
    set autoread
    set autowrite
" }
" 20. The swap file {
    set directory=~/.vim/tmp
" }
" 21. Command line editing {
    set history=10000
    set wildmode=full
    set wildmenu
    set cmdwinheight=12
" }
" 25. Multi-byte characters {
    set encoding=utf-8
" }
