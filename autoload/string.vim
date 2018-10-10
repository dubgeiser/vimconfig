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
"   DubVim Vim autoload functions for strings.
"
"
" }

if exists("g:string_loaded") || &cp
    finish
endif
let g:string_loaded = 1


" @param string
" @return string The given string with newlines removed
function! string#RemoveNewline(s) abort
    return substitute(a:s, "\n", "", "g")
endfunction


" If there isn't one, append a semi colon to the end of the current line.
function! string#AppendSemiColon() abort
    if getline('.') !~ ';$'
        let save_cursor = getpos('.')
        exec("s/$/;/")
        call setpos('.', save_cursor)
    endif
endfunction
