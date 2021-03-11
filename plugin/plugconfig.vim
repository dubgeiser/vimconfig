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
"   DubVim Plugin Configuration
" }

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
    nnoremap <Leader>g :Gstatus<CR>
" }
" UltiSnips {
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" }
" ArgWrap {
    nnoremap <Leader>a :ArgWrap<CR>
" }
" Lightline {
    let g:lightline = {
        \ 'colorscheme' : 'solarized',
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
