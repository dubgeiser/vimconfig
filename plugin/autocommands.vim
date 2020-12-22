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
"   DubVim Autocommands
" }


" Event handlers {
" Only set the cursor line when not in a help buffer.
function! s:WinEnterSetCursorLine() abort
    if &buftype == 'help'
        set nocursorline
    else
        set cursorline
    endif
endfunction
" }
augroup file_type_defines " {
    au!
    autocmd BufNewFile,BufRead *.tpl set filetype=xhtml
    autocmd BufNewFile,BufRead *.html.twig set filetype=htmldjango
augroup END " }
augroup file_type_settings " {
    au!
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType mail setlocal nocindent textwidth=72
    autocmd FileType text,rst setlocal nocindent
    autocmd FileType gitcommit setlocal spell nolist nocindent

    " For programming languages using a semi colon at the end of statement.
    autocmd FileType c,cc,cpp,css,java,javascript,lex,perl,php,sql,y
        \ nnoremap <silent> <Leader>; :call string#AppendSemiColon()<CR>

    autocmd FileType php setlocal omnifunc=phpactor#Complete
augroup END " }
augroup vim_setup " {
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
    autocmd BufEnter,WinEnter,InsertLeave * call <SID>WinEnterSetCursorLine()
    autocmd WinLeave,InsertEnter * set nocursorline
augroup END " }
augroup fu_help " {
    au!
    autocmd BufWritePost ~/.config/nvim/doc/* :helptags ~/.config/nvim/doc/
augroup END " }
augroup markdown " {
    au!
    au BufNewFile,BufRead *.md,*.markdown,*.mkd setlocal filetype=ghmarkdown
augroup END " }
