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
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4

" Error formats {
    set errorformat+=%m\ in\ %f\ on\ line\ %l               " Standard PHP
    set errorformat+=%m\ at\ \[%f\ line\ %l]                "SimpleTest fail
    set errorformat+=%E%\\d%\\+)\ %m,%CFailed%m,%Z%f:%l,%-G "PHPUnit fail
"}

" Doing quite some symfony, load specific snippets when in PHP files.
exec("UltiSnipsAddFiletypes php-symfony2")
