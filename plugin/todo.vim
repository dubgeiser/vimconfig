" Description: simple todo lists
" Author: P. Juchtmans
" License: http://sam.zoy.org/wtfpl/COPYING
"          No warranties, expressed or implied.
"
" Someday Maybe:
"   - Overview open todo's, ideas:
"       - list of open todo's in separate buffer (cfr Tasklist)
"       - reorder the todo's and move the ones that are finished or cancelled
"         to the bottom.
"   - Todo_TickRecursively(): When todo line is ticked, all subsequently
"     indented lines are checked.  Maybe make it configurable: it is already
"     possible to tick a selection.
"   - Make A tickbox from visual selection and indent it nicely (at the moment
"     every line in the selection will be marked with a tickbox):
"
"       So if this would be the
"       complete text and it is
"       selected to make it a task,
"       it would come out:
"
"       [ ] So if this would be the
"           complete text and it is
"           selected to make it a
"           ...


if exists('todo_loaded') || &cp || version < 700
    finish
endif
let todo_loaded = 1


fun Todo_ToggleTickbox()
    if s:currentLineHasEmptyTickbox()
        call Todo_RemoveTickbox()
    elseif s:currentLineHasTickbox()
        call Todo_TickOpen()
    else
        call Todo_PlaceTickbox()
    endif
endf

fun Todo_PlaceTickbox()
    if ! s:currentLineHasTickbox()
        let save_cursor = getpos('.')
        exec('s/^\(\s*\)/\1\[ \] /')
        " compensate for inserting the todo tick box
        let save_cursor[2] += 4
        call setpos('.', save_cursor)
    endif
endf

fun Todo_RemoveTickbox()
    if s:currentLineHasTickbox()
        let save_cursor = getpos('.')
        exec('s/^\(\s*\)\[[ VX]\] /\1/')
        " compensate for removing the todo tick box
        let save_cursor[2] -= 4
        call setpos('.', save_cursor)
    endif
endf

fun Todo_TickFinished()
    call s:tick('V')
endf

fun Todo_TickCancelled()
    call s:tick('X')
endf

fun Todo_TickOpen()
    call s:tick(' ')
endf

fun s:currentLineHasTickbox()
    return getline(".") =~ '^\s*\[[ VX]\]'
endf

fun s:currentLineHasEmptyTickbox()
    return getline(".") =~ '^\s*\[[ ]\]'
endf

fun s:tick(char)
    if s:currentLineHasTickbox()
        let save_cursor = getpos('.')
        exec('s/^\(\s*\)\[[ VX]\]/\1\[' . a:char . '\]/')
        call setpos('.', save_cursor)
    endif
endf
