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
"   `:terminal` is available since Vim 8.0 and this plugin assumes Vim 8.
"
"   This plugin has not been tested with a Vim version lower than 8.0.1272
"
"   Register a REPL command for a specific file type:
"
"       `repl#Register(filetype, command)`
"
"
"   Set the windows width threshold at which we will split vertically and put
"   the REPL window to the right (default is 150):
"
"       `g:repl_vsplit_threshold`
"
" }

if exists("g:repl_loaded") || &cp
    finish
endif
let g:repl_loaded = 1

" Run the Read-Eval-Print-Loop for a given file type.
" Tip: command! Repl call repl#Run(&filetype)
function! repl#Run(file_type) abort
    if repl#Has(a:file_type)
        exec(s:window_placement()." terminal ".repl#Get(a:file_type))
    elseif a:file_type == ""
        :echo "*** You cannot run a REPL if &filetype is not set."
    else
        :echo "*** No REPL found for [".a:file_type."] files"
        :echo "Use repl#Register('".a:file_type."', '<REPL>')"
    endif
endfunction

" Map a file type to a shell command that starts a repl.
function! repl#Register(file_type, repl_command) abort
    let s:repls[a:file_type] = a:repl_command
endfunction

" Is there a REPL registered for the given file type?
function! repl#Has(file_type) abort
    return has_key(s:repls, a:file_type)
endfunction

" Get the registered REPL command for a given file type.
" If no REPL was registered for the file type, raise an error.
" You can check if the file type was registered via repl#Has().
function! repl#Get(file_type) abort
    return s:repls[a:file_type]
endfunction

" Return a string with Vim split behavior commands.
function! s:window_placement() abort
    return winwidth("%") > g:repl_vsplit_threshold
                \? "vertical botright" : "rightbelow"
endfunction

" Initialize defaults.
let g:repl_vsplit_threshold = 150
let s:repls = {}
call repl#Register('php', 'php -a')
call repl#Register('python', 'python3')
call repl#Register('ruby', 'irb')
