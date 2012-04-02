" ==============================================================================
" Description: Vim functions.
" Use: Source it from vimrc or put in autoload/ directory.
" Author: P. Juchtmans
" ==============================================================================

if exists("g:functions_loaded") || &cp
    finish
endif
let g:functions_loaded = 1


" If there isn't one, append a semi colon to the end of the current line.
function! functions#append_semi_colon()
    if getline('.') !~ ';$'
        let save_cursor = getpos('.')
        exec("s/$/;/")
        call setpos('.', save_cursor)
    endif
endfunction


" Remove trailing whitespace from the current buffer.
function! functions#rtrim()
    exec('%s/\s\+$//e')
endfunction


" @return string The git branch we're in, empty if none.
function! functions#git_branch()
    return system("git branch 2>/dev/null | grep '^\*' | sed 's/^\* //'")
endfunction

