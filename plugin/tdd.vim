" Description: TDD plugin
"   Shows the green / red bar.
" Author: P. Juchtmans
" License: http://sam.zoy.org/wtfpl/COPYING
"          No warranties, expressed or implied.


if exists('tdd_loaded') || &cp || version < 700
    finish
endif
let tdd_loaded = 1


fun! ShowTestSuccess()
    hi TestSuccess ctermfg=white ctermbg=green guibg=green
    echohl TestSuccess
    echon repeat(" ", &columns)
    echohl
endf


fun! ShowTestFail()
    hi TestFail ctermfg=white ctermbg=red guibg=red
    echohl TestFail
    echon repeat(" ", &columns)
    echohl
endf


