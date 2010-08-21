" Main file type configuration for PHP

set fileformat=unix
set textwidth=0

set makeprg=php\ -l\ %
"set makeprg=php\ %

" PHP error
set errorformat+=%m\ in\ %f\ on\ line\ %l

" SimpleTest Failing Test
set errorformat+=%m\ at\ \[%f\ line\ %l]

let g:Tdd_makeprg='php\ %'

