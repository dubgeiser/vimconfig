" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

if exists("g:string_loaded") || &cp
    finish
endif
let g:string_loaded = 1


" @param string
" @return string The given string with newlines removed
function! string#RemoveNewline(s) abort
    return substitute(a:s, "\n", "", "g")
endfunction
