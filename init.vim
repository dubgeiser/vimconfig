" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

"
"   DubVim init.vim (used to be .vimrc)
"   Settings are grouped like they appear in the `:options` list.
"   Plugins are managed by junegunn/vim-plug
"
"   This configuration assumes Neovim, and as such does not unnecessary things
"   like `set nocompatible`, since Neovim comes with sensible defaults out of
"   the box.
"
"   This is my personal configuration, I do not put any effort into being
"   compatible with other setups than my own.
"   At the moment this is Neovim in Kitty terminal on Mac OSX.
"

" 0. Plugin management {
    " Auto load the plugin manager
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        echo "If plugins were not installed, issue a `:PlugInstall` manually\n"
        echo "And then reload Neovim"
    endif

    " Since it is advised not to use known Vim directory names, we don't use
    " pack, but reinstate the Ruby-inspired directory from pathogen.
    call plug#begin('~/.config/nvim/bundle')
    Plug 'FooSoft/vim-argwrap'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'janko/vim-test'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'junegunn/vim-plug'
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'mileszs/ack.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'vim-scripts/cmdline-completion'
    Plug 'romainl/vim-cool'
    Plug 'sainnhe/gruvbox-material'
    call plug#end()

    let g:coc_global_extensions = [
        \ 'coc-json',
        \ 'coc-pyright',
        \ 'coc-lua',
        \ 'coc-phpactor',
        \ 'coc-yaml',
      \ ]

    " Make sure help is up to date.
    " Assumes that all plugins are installed.
    " Fails silently and will continue execution.
    :silent! helptags ALL
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
    " Make terminal version looks as close to GUI as possible.
    " Note: works in Truecolor Terminals like iTerm and Kitty,
    " but not in standard OSX Terminal.
    set termguicolors

    set background=dark
    colorscheme gruvbox-material

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
