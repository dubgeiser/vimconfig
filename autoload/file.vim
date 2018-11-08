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
"   DubVim Vim autoload functions that operate on files and paths.
"
"
" }

if exists("g:file_loaded") || &cp
    finish
endif
let g:file_loaded = 1


" Display a short path where the first directory is displayed with its
" full name, and the subsequent directories are shortened to their
" first letter, i.e. "/home/user/foo/foo/bar/baz.vim" becomes
" "~/foo/f/b/baz.vim"
function! file#ShortPath() abort
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