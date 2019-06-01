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
"   DubVim setup for distraction-free writing.
" }

if !(exists(":Goyo") && exists(":Limelight"))
    finish
endif

let s:writing_mode_enabled=0

function! s:toggle_writing_mode() abort
    if s:writing_mode_enabled
        exec(":q")
        exec(":Limelight!")
        let s:writing_mode_enabled=0
    else
        exec(":Goyo")
        exec(":Limelight 0.6")
        let s:writing_mode_enabled=1
    endif
endfunction


command! ToggleWritingMode call <SID>toggle_writing_mode()
nnoremap <Leader>w :ToggleWritingMode<cr>
