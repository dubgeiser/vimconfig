" Main file type configuration for PHP

set fileformat=unix
set textwidth=0

nnoremap <leader>f /function\s*
nnoremap <leader>i :call PhpInsertUse()<CR>

set makeprg=php\ -l\ %

" PHP error
set errorformat+=%m\ in\ %f\ on\ line\ %l

" SimpleTest Failing Test
set errorformat+=%m\ at\ \[%f\ line\ %l]

" PHPUnit
set errorformat+=%E%\\d%\\+)\ %m,%CFailed%m,%Z%f:%l,%-G

let g:Tdd_makeprg='phpunit'

if !exists(":PSR2")
	command PSR2 exec("w") | exec("!php-cs-fixer --level=psr2 --fixers=unused_use fix %")
	nnoremap <silent> <S-F5> :PSR2<CR>
endif
