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
" Lightline {
    let g:lightline = {
        \ 'colorscheme' : 'gruvbox',
        \ 'component_function' : {
        \   'filename' : 'LightLineFilePath'
        \ }
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
" matchit.vim {
    packadd! matchit
" }
