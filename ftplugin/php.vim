" Main file type configuration for PHP


" Use hard tabs that take 4 spaces visually.
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
set noexpandtab

set fileformat=unix
set textwidth=0

nmap <leader>f /function\s*
nmap <leader>i :call PhpInsertUse()<CR>

set makeprg=php\ -l\ %

" PHP error
set errorformat+=%m\ in\ %f\ on\ line\ %l

" SimpleTest Failing Test
set errorformat+=%m\ at\ \[%f\ line\ %l]

" PHPUnit
set errorformat+=%E%\\d%\\+)\ %m,%CFailed%m,%Z%f:%l,%-G

let g:Tdd_makeprg='phpunit %'

