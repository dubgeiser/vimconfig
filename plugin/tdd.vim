" Description: TDD plugin
"           Runs a file with tests in them and shows a green or red bar
"           depending on the fact that the test(s) passed or failed.
"
" Known Limitations:
"           - Only tested with PHP and SimpleTest's autorun.
"           - The file must be runnable, if it is not, a green bar will be
"             displayed.
"           - If the file has parse errors, this will not be picked up by the
"             process and a green bar will be shown
"
" Author: P. Juchtmans
" License: http://sam.zoy.org/wtfpl/COPYING
"          No warranties, expressed or implied.
"
" To Do:
"   - Add ability to configure test runner
"   - Catch parse errors
"   - Add ability to run tests in different languages.


if exists('tdd_loaded') || &cp || version < 700
    finish
endif
let tdd_loaded = 1



" Run a given testfile, pass '%' for the file in the current buffer.
fun! Tdd_RunTestFile(fn)
    call s:runTest(a:fn)
    if s:isSuccess()
        call s:showTestSuccess()
    else
        call s:showTestFail()
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
    silent exec "make " . a:fn
    silent !echo
endf

fun! s:showTestSuccess()
    call s:showBar("TestSuccess")
endf

fun! s:showTestFail()
    call s:showBar("TestFail")
endf

fun! s:showBar(higroup)
    hi TestSuccess ctermfg=white ctermbg=green guibg=green
    hi TestFail ctermfg=white ctermbg=red guibg=red
    exec "echohl " . a:higroup
    " We do not want a blank line after our colored bar.
    echon repeat(" ", &columns - 1)
    echohl
endf

