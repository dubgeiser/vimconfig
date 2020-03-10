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
"   DubVim Vim autoload functions that operate on a buffer.
"
"
" }

if exists("g:buffer_loaded") || &cp
    finish
endif
let g:buffer_loaded = 1


function! buffer#RemoveTrailingWhitespace() abort
    let save_cursor = getpos('.')
    exec('%s/\s\+$//e')
    call setpos('.', save_cursor)
endfunction

function! buffer#RemoveEofBlankLines() abort
    let save_cursor = getpos('.')
    normal G
    while getline('.') == ""
        normal dd
    endwhile
    call setpos('.', save_cursor)
endfunction


" Display some useful info on the file in the current buffer.
function! buffer#Info() abort
    echo printf("%s (%s)",
                \string#RemoveNewline(system("pwd")),
                \buffer#GitBranch())
    echo printf("%s", bufname("%"))
    echo printf("%d lines of %s, %s, %s",
                \line("$"),
                \&filetype,
                \&fileformat,
                \&fileencoding)
endfunction


" @return string The current git branch
function! buffer#GitBranch() abort
    return string#RemoveNewline(
                \system("git branch 2>/dev/null | grep '^\*' | sed 's/^\* //'"))
endfunction

function! buffer#ToggleLineWrap() abort
    if &wrap
        :set nowrap
    else
        :set wrap
    endif
endfunction
