" vim: set ft=vim sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:

command! Rtrim call buffer#RemoveTrailingWhitespace()
command! Etrim call buffer#RemoveEofBlankLines()
command! Info call buffer#Info()
command! Repl call repl#Run(&filetype)
