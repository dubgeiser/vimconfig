" DubVim - modeline, notes, info, ... {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
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

" Important {
    " Things that need to get done before anything else.

    set nocompatible
    au!
    filetype plugin indent on
    set rtp+=/usr/local/opt/fzf
" }

" Moving around, searching and patterns {
    set incsearch
    set ignorecase  " Ignore case sensitivity....
    set smartcase   " ... Unless there's a capital letter
" }

" Displaying text {
    set sidescrolloff=5
    set display+=lastline
    set relativenumber
    set number
    set list
    set listchars=tab:⇒\ ,extends:»,precedes:«,trail:▒,nbsp:·
" }

" Syntax, highlighting and spelling {
    colorscheme solarized
    syntax on
    set nocursorcolumn
    set nocursorline
    set colorcolumn=80
" }

" Multiple windows {
    set laststatus=2
    set statusline=%<%{functions#short_path()}%t\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)
    set winminheight=0  " Allow for fully minimized windows.
    set hidden          " Remember undo, even when buffer is not active.
" }

" Messages and info {
    set showcmd
    set noerrorbells
    set visualbell
" }

" Editing text {
    set undofile
    set undodir=~/.vim/tmp
    set backspace=indent,eol,start whichwrap+=<,>,[,]

    " Complete as far as possible, no menu etc if there's only 1 match.
    " Show menu if there's more than 1 possible completion.
    " Show extra info if menu (preview)
    set completeopt=preview,menu,longest
" }

" Tabs and indenting {
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set autoindent
    set smartindent
    set cindent
" }

" Reading and writing files {
    set fileformat=unix
    set autoread
    set autowrite
" }

" The swap file {
    set directory=~/.vim/tmp
" }

" Command line editing {
    set history=10000
    set wildmode=full
    set wildmenu
    set cmdwinheight=12
" }

" Multi-byte characters {
    set encoding=utf-8
" }

" Auto commands  {
    augroup file_type_defines
        au!
        autocmd BufNewFile,BufRead *.tpl set filetype=xhtml
        autocmd BufNewFile,BufRead *.html.twig set filetype=htmldjango
    augroup END
    augroup file_type_settings
        au!
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
        autocmd FileType mail setlocal nocindent textwidth=72
        autocmd FileType text,rst setlocal nocindent
        autocmd FileType gitcommit setlocal spell nolist nocindent
        autocmd FileType markdown,text call pencil#init()

        " For programming languages using a semi colon at the end of statement.
        autocmd FileType c,cc,cpp,css,java,javascript,lex,perl,php,sql,y
            \ nnoremap <silent> <Leader>; :call functions#append_semi_colon()<CR>

        autocmd FileType php setlocal omnifunc=phpactor#Complete
    augroup END
    augroup vim_setup
        au!

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event
        " handler (happens when dropping a file on gvim).
        " When editing a commit message (gitcommit for instance), just ignore
        " the last cursor position, it'll probably be wrong anyway.
        autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") && &ft !~# 'commit' |
            \   exe "normal g`\"" |
            \ endif

        autocmd FocusLost * silent! wall
    augroup END
    augroup fu_help
        au!
        autocmd BufWrite *fu.txt :helptags ~/.vim/doc/
    augroup END
    augroup markdown
        au!
        au BufNewFile,BufRead *.md,*.markdown,*.mkd setlocal filetype=ghmarkdown
    augroup END
" }

" Abbreviations and typo's {
    " Compensate for the FUCKING Mac AZERTY BE layout, for instance:
    " typing "|| " fast will result in the trailing char to be char 160
    " instead of 32.
    inoremap   <Space>
" }

" Key bindings {
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

    " :Buffers and :Files are commands provided by the FZF plugin.
    nnoremap <Leader>b :Buffers<CR>
    nnoremap <Leader>e :Files<cr>

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
    nnoremap <Leader>p :cd ~/Projects/*

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
" }

" MacVim {
    " MacVim loads a custom vimrc to make Gvim behave more like a Mac app.
    " This section's purpose is to try to load as little as possible.

    let macvim_skip_cmd_opt_movement = 1
    let macvim_skip_colorscheme = 1
" }

" Commands {
    command! Rtrim call functions#rtrim()
    command! Tsquint call functions#toggle_squint_mode()
    command! Info call functions#buffer_info()
    command! Repl call repl#run(&filetype)
" }

" Plugin Configuration {
    " fzf {
        if !has("gui_running")
            let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
              \ 'bg':      ['bg', 'Normal'],
              \ 'hl':      ['fg', 'Comment'],
              \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
              \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
              \ 'hl+':     ['fg', 'Statement'],
              \ 'info':    ['fg', 'PreProc'],
              \ 'border':  ['fg', 'Ignore'],
              \ 'prompt':  ['fg', 'Conditional'],
              \ 'pointer': ['fg', 'Exception'],
              \ 'marker':  ['fg', 'Keyword'],
              \ 'spinner': ['fg', 'Label'],
              \ 'header':  ['fg', 'Comment'] }
        endif
    " }

    " UltiSnips {
        let g:UltiSnipsExpandTrigger="<Tab>"
        let g:UltiSnipsJumpForwardTrigger="<Tab>"
        let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
    " }

    " ArgWrap {
        nnoremap <Leader>a :ArgWrap<CR>
    " }

    " Phpactor {
        nnoremap <Leader>r :call phpactor#ContextMenu()<CR>
        vnoremap <Leader>r :call phpactor#ContextMenu()<CR>
    " }

    " Ale {
        nnoremap <Leader>j :ALENextWrap<CR>
        nnoremap <Leader>k :ALEPreviousWrap<CR>
    " }

    " matchit.vim {
        if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
          runtime! macros/matchit.vim
        endif
    " }
" }

" GUI {
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

        set linespace=1

        " Take up all the space when running full screen MacVim
        set fuoptions=maxvert,maxhorz

        set guifont=Consolas:h18
        set antialias
    endif
" }
