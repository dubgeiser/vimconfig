" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

if exists("g:file_loaded") || &cp
    finish
endif
let g:file_loaded = 1


" Display a short path where the first directory is displayed with its
" full name, and the subsequent directories are shortened to their
" first letter, i.e. `/home/user/foo/foo/bar/baz.vim` becomes
" `~/foo/f/b/baz.vim`
"
" This kinda duplicates the behavior of `pathshorten()` but it differs because
" `pathshorten()` also truncates the first directory name in the path, which
" is undesired behavior since a lot of info is in there, plus, it also helps
" in differentiating between Git buffer and its corresponding file when doing
" `:GDiff` and the likes.
function! file#ShortPath() abort
    let dirsep = has('win32') && ! &shellslash ? '\' : '/'
    let filepath = expand('%:p')
    if empty(filepath)
        return ''
    endif
    let mod = (exists('+acd') && &acd) ? ':~' : ':~:.'
    let fpath = split(fnamemodify(filepath, mod), dirsep)
    let filename = remove(fpath, -1)

    " Empty fpath happens when editing a file in '/' or in current directory on
    " Unix-based systems.
    " This behavior is untested under Windows!
    if empty(fpath)
        return empty(filename) ? dirsep : filename
    endif

    let fpath_shortparts = map(fpath[1:], 'v:val[0]')
    let path = join(extend([fpath[0]], fpath_shortparts), dirsep) . dirsep
    if path == ('.' . dirsep)
        let path = ''
    endif
    return path . filename
endfunction
