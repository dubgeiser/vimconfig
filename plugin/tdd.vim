" Description: TDD plugin
"           Runs a file with tests and shows a green or red bar depending on
"           the fact that the test(s) passed or failed.
"
" Author: P. Juchtmans
" License: http://sam.zoy.org/wtfpl/COPYING
"          No warranties, expressed or implied.
"
" Usage: In the ftplugin directory of your vim configuration, add an
"       errorformat for the output of your test runner that you use.  You can
"       add an errorformat like this (note the + sign):
"
"           set errorformat+=%m\ at\ \[%f\ line\ %l]
"       
"       Then define the test runner in g:Tdd_makeprg, which is actually a
"       makeprg definition that will be used for running the tests.  You can
"       use the same format as Vim's makeprg, but you must enclose it in
"       single quotes, ex:
"
"           let g:Tdd_makeprg='php\ %'
"
"       tdd.vim will remember the current makeprg setting and will restore
"       that after the test is run.
"
"       To run a test:
"
"           :call Tdd_RunTestFile('/path/to/test/file')
"
"       This will then save your current makeprg setting, set g:Tdd_makeprg as
"       the makeprg, execute Vim's make, match the output against the list of
"       defined errorformat and if it finds anything in the output that
"       matches, it shows a red bar, otherwise a green one.  After that the
"       original makeprg setting is restored.
"
"       Note that it's best to define a key map that runs the current file in
"       the current buffer:
"
"           :nmap <Leader>r :call Tdd_RunTestFile('%')

"
" Known Limitations:
"           - Only tested with PHP and SimpleTest's autorun on Mac & Linux
"           - The test file must be runnable, if it is not, a green bar will
"             be displayed.
"
" To Do:
"   - Show error message for failed tests.


if exists('tdd_loaded') || &cp || version < 700
    finish
endif
let tdd_loaded = 1


" Run a given testfile, pass '%' for the file in the current buffer.
fun! Tdd_RunTestFile(fn)
    call s:runTest(a:fn)
    if s:isSuccess()
        call s:showSuccess()
    else
        call s:showFailure()
    endif
endf

fun! s:isSuccess()
    for each in getqflist()
        if each['valid'] == 1
            return 0
        endif
    endfor
    return 1
endf

fun! s:runTest(fn)
    let save_makeprg=&makeprg
    exec "set makeprg=" . g:Tdd_makeprg
    silent exec "make " . a:fn
    silent !echo
    " TODO Escaping SPACE alone will probably not be enough
    exec "set makeprg=" . escape(save_makeprg, ' ')
endf

fun! s:showSuccess()
    call s:showBar("Success")
endf

fun! s:showFailure()
    call s:showBar("Failure")
endf

fun! s:showBar(higroup)
    hi Tdd_Success ctermfg=white ctermbg=green guibg=green
    hi Tdd_Failure ctermfg=white ctermbg=red guibg=red
    exec "echohl Tdd_" . a:higroup
    " We do not want a blank line after our colored bar.
    echon repeat(" ", &columns - 1)
    echohl
endf

