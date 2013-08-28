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


" Toggle squint mode.
" Squint mode gives a bird's eye view of the current buffer, thus helping in
" identifying blocks of code that might need refactoring.
" TODO save window locations
function! functions#toggle_squint_mode()
    if !exists("g:squint_mode")
        let g:squint_mode = "normal"
        let g:squint_mode_colorscheme = "newnoise"
        let g:squint_mode_font = "Menlo:h4"
    endif
    if g:squint_mode == "squint"
        exec("colorscheme " . g:squint_mode_save_colorscheme)
        exec("set guifont=" . g:squint_mode_save_font)
		exec("set lines=" . g:squint_mode_save_lines)
		exec("set columns=" . g:squint_mode_save_columns)
        let g:squint_mode = "normal"
    else
        let g:squint_mode_save_colorscheme = g:colors_name
        let g:squint_mode_save_font = &guifont
		let g:squint_mode_save_lines = &lines
		let g:squint_mode_save_columns = &columns
        exec("colorscheme " . g:squint_mode_colorscheme)
        exec("set guifont=" . g:squint_mode_font)
        let g:squint_mode = "squint"
    endif
endfunction
