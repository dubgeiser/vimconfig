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
"   DubVim Vim autoload functions.
"
"
" }

if exists("g:functions_loaded") || &cp
    finish
endif
let g:functions_loaded = 1


" If there isn't one, append a semi colon to the end of the current line.
function! functions#AppendSemiColon() abort
    if getline('.') !~ ';$'
        let save_cursor = getpos('.')
        exec("s/$/;/")
        call setpos('.', save_cursor)
    endif
endfunction


" Display some useful info on the file in the current buffer.
function! functions#BufferInfo() abort
    echo printf("%s (%s)",
                \functions#RemoveNewline(system("pwd")),
                \functions#GitBranch())
    echo printf("%s", bufname("%"))
    echo printf("%d lines of %s, %s, %s",
                \line("$"),
                \&filetype,
                \&fileformat,
                \&fileencoding)
endfunction


" @param string
" @return string The given string with newlines removed
function! functions#RemoveNewline(s) abort
    return substitute(a:s, "\n", "", "g")
endfunction


" @return string The current git branch
function! functions#GitBranch() abort
    return functions#RemoveNewline(
                \system("git branch 2>/dev/null | grep '^\*' | sed 's/^\* //'"))
endfunction

" Remove trailing white space from the current buffer.
function! functions#Rtrim() abort
    let save_cursor = getpos('.')
    exec('%s/\s\+$//e')
    call setpos('.', save_cursor)
endfunction


" Display a short path where the first directory is displayed with its
" full name, and the subsequent directories are shortened to their
" first letter, i.e. "/home/user/foo/foo/bar/baz.vim" becomes
" "~/foo/f/b/baz.vim"
function! functions#ShortPath() abort
    let dirsep = has('win32') && ! &shellslash ? '\' : '/'
    let filepath = expand('%:p')
    if empty(filepath)
        return ''
    endif
    let mod = (exists('+acd') && &acd) ? ':~:h' : ':~:.:h'
    let fpath = split(fnamemodify(filepath, mod), dirsep)

    " Empty fpath happens when editing a file in '/' on Unix-based systems
    " This behavior is untested under Windows!
    if empty(fpath)
        return dirsep
    endif

    let fpath_shortparts = map(fpath[1:], 'v:val[0]')
    let path = join(extend([fpath[0]], fpath_shortparts), dirsep) . dirsep
    if path == ('.' . dirsep)
        let path = ''
    endif
    return path
endfunction
