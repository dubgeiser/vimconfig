" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

" fzf {
    let g:fzf_layout = {'window': {'width': 0.8, 'height': 0.8}}
    let g:fzf_preview_window = ['up:50%:hidden', 'ctrl-/']
    let $FZF_DEFAULT_OPTS='--reverse'

    nnoremap <Leader>b :Buffers<CR>
    nnoremap <Leader>e :GFiles<CR>
    nnoremap <Leader>o :Files<CR>
    nnoremap <Leader>h :Helptags<CR>
    nnoremap <Leader>/ :BLines<CR>
    nnoremap <Leader>d :BTags<CR>
    nnoremap <Leader>c :Commits<CR>
    if executable('ag')
        nnoremap <Leader>f :Ag<CR>
    endif
" }
" Fugitive {
    nnoremap <Leader>g :Git<CR>
" }
" ArgWrap {
    nnoremap <Leader>a :ArgWrap<CR>
" }
" Lightline {
    let g:lightline = {
        \ 'colorscheme' : 'gruvbox_material',
        \ 'active': {
        \   'left': [ ['mode', 'paste'],
        \             ['cocstatus', 'readonly', 'filename', 'modified'] ]
        \ },
        \ 'component_function' : {
        \   'filename' : 'LightLineFilePath',
        \ },
        \ 'mode_map' : {
        \   'n' : 'N ',
        \   'i' : 'I ',
        \   'R' : 'R ',
        \   'v' : 'V ',
        \   'V' : 'VL',
        \   "\<C-v>": 'VB',
        \   'c' : 'C ',
        \   's' : 'S ',
        \   'S' : 'SL',
        \   "\<C-s>": 'SB',
        \   't': 'T ',
        \ },
    \ }

    " Return the filename component for LightLine, depending on the type of
    " file or buffer.
    function! LightLineFilePath() abort
        if &buftype == 'help'
            let filename = expand("%:t")
        elseif &buftype == 'terminal'
            let filename = ''
        else
            let filename = file#ShortPath()
        endif
        return filename
    endfunction
" }
" Test {
    let g:test_has_been_run = 0
    function! RunTest() abort
        if g:test_has_been_run
            :TestLast
        else
            :TestFile
            let g:test_has_been_run = 1
        endif
    endfunction

    nnoremap <Leader>t :call RunTest()<CR>
" }
" Ack {
    if executable('ag')
        let g:ackprg = 'ag --vimgrep'
    endif
" }
" Coc {
" Incrementally copypasting from CoC's README
    set nobackup
    set nowritebackup
    set cmdheight=2
    set updatetime=200
    set shortmess+=c
    set signcolumn=number

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" }
