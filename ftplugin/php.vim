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
"   DubVim PHP specific config.
"
"
" }

set fileformat=unix
set textwidth=0

nnoremap <leader>f /function\s*
nnoremap <leader>i :call PhpInsertUse()<CR>

set makeprg=php\ -l\ %
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4

" PHP error
set errorformat+=%m\ in\ %f\ on\ line\ %l

" SimpleTest Failing Test
set errorformat+=%m\ at\ \[%f\ line\ %l]

" PHPUnit
set errorformat+=%E%\\d%\\+)\ %m,%CFailed%m,%Z%f:%l,%-G

let g:Tdd_makeprg='phpunit'

if !exists(":PSR2")
    command PSR2 exec("w") | exec("!php-cs-fixer --level=psr2 --fixers=unused_use fix %")
    nnoremap <silent> <S-F5> :PSR2<CR>
endif


" @param string path Path to convert to a namespace
"        Assume that the first directory in the path must be dropped and that
"        we are dealing with a file (ie. the last element can be dropped too).
" @return string the namespace for that path
fun! PathToNamespace(path)
    return join(split(a:path, '/')[1:-2], '\')
endf

fun! Namespace()
    exec('s/^/' . 'namespace ' . escape(PathToNamespace(expand("%")), '\') . ';')
endf

command! Namespace call Namespace()

" Doing quite some symfony, load specific snippets when in PHP files.
exec("UltiSnipsAddFiletypes php-symfony2")
