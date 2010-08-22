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
"           - When a test run is a success, the last line of the test run
"             output is re-echoed in the green bar, depending on the output
"             format of your test runner, this might not be the result you
"             were hoping for.
"           - Yes, I am aware of the tragic irony that this plugin does not
"             have tests.
"
" To Do:
"   - Introduce awareness for alternating files, fi. '.inc.php' and
"     '.test.php'.  This makes it possible to edit the CUT and simply run the
"     test.  (well, sort of, assuming CUT and test itself are in the buffers
"     fi.)
"   - Better error handling for things like checking if 'Tdd_makeprg' is
"     defined.


if exists('tdd_loaded') || &cp || version < 700
    finish
endif
let tdd_loaded = 1


" Run a given testfile, pass '%' for the file in the current buffer.
fun! Tdd_RunTestFile(fn)
    call s:runTest(a:fn)
    let result = s:processTestOuput()
    call s:showBar(result.type, result.message)
endf


fun! s:runTest(fn)
    let save_makeprg=&makeprg
    exec "set makeprg=" . g:Tdd_makeprg
    silent exec "make " . a:fn
    silent !echo
    " TODO Escaping SPACE alone will probably not be enough
    exec "set makeprg=" . escape(save_makeprg, ' ')
endf

" Process the output of the test run.
" Return following Dictionary:
"   {
"       'type' : string Either 'Success' or 'Failure',
"       'message' : Either the first encountered error message 'type' will be
"                   'Failure', or the last line of the test run output, 'type'
"                   will be 'Success'.
"   }
fun! s:processTestOuput()
    let result = {}
    for each in getqflist()
        if each.valid == 1
            return {'type' : 'Failure', 'message' : each.text}
        endif
    endfor
    return {'type' : 'Success', 'message' : each.text}
endf

" 'success_or_failure' string Either 'Success' or 'Failure'
fun! s:showBar(success_or_failure, message)
    hi Tdd_Success ctermfg=white ctermbg=green guibg=#256414
    hi Tdd_Failure ctermfg=white ctermbg=red guibg=#dd2212
    exec "echohl Tdd_" . a:success_or_failure
    echon a:message
    " -1 because we don't want a blank line
    echon repeat(" ", &columns - len(a:message) - 1)
    echohl
endf

