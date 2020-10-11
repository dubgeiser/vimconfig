" DubVim - modeline, notes, info, ... {
" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
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
"   DubVim MacVim specific settings
" }

if has("mac") && has("gui")
    set antialias
    set fuoptions=maxvert,maxhorz
    " MacVim loads a custom vimrc to make Gvim behave more like a Mac app.
    " This section's purpose is to try to load as little as possible.
    let macvim_skip_cmd_opt_movement = 1
    let macvim_skip_colorscheme = 1
end
