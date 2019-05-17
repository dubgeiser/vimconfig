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
" TagBar {
    let g:tagbar_autofocus=1
    let g:tagbar_autoclose=1
    let g:tagbar_expand=1
    let g:tagbar_silent=1
    nnoremap <F8> :TagbarToggle<CR>
" }
" Lightline {
    let g:lightline = {
        \ 'colorscheme' : 'gruvbox',
        \ 'component_function' : {
        \   'filename' : 'file#ShortPath'
        \ }
    \ }
" }
" matchit.vim {
    packadd! matchit
" }
