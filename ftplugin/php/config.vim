" Main file type configuration for PHP


" Use hard tabs that take 4 spaces visually.
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
set noexpandtab

set fileformat=unix
set textwidth=0

set makeprg=php\ -l\ %
"set makeprg=php\ %

" PHP error
set errorformat+=%m\ in\ %f\ on\ line\ %l

" SimpleTest Failing Test
set errorformat+=%m\ at\ \[%f\ line\ %l]

let g:Tdd_makeprg='php'

