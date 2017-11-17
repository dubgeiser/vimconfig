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
"   DubVim repl
"
"   Repl = Read Eval Print Loop, also known as an interactive top level (or
"   language) shell.
"
"   This plugin will fie up a terminal with a repl running that is based on
"   the file of the file in the current buffer.
"
"   :terminal is available since Vim 8.0 and this plugin assumes Vim 8.
"
"   This plugin has not been tested with a Vim version lower than 8.0.1272
"
" }


if exists("g:repl_loaded") || &cp
    finish
endif
let g:repl_loaded = 1


" Return the command (as a string) that will fire up the repl associated with
" the given file type.
" If the file type cannot be mapped to a repl, return an empty string.
function! repl#command(file_type)
    let known_repls = {
                \ "php" : "php -a",
                \ "python" : "python3",
                \ "ruby" : "irb",
                \}

    return has_key(known_repls, a:file_type) ? known_repls[a:file_type] : ""
endfunction


" Run the Read-Eval-Print-Loop for a given file type.
" handy:  command! Repl call repl#run(&filetype)
function! repl#run(file_type)
    let full_command = repl#command(a:file_type) == ""
        \? "echo ' *** NO REPL FOUND FOR FILE TYPE [" . a:file_type . "] ***'"
        \: "vert bo terminal " . repl#command(a:file_type)

    exec(full_command)
endfunction
