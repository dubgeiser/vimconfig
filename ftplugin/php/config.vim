" Main file type configuration for PHP

set fileformat=unix
set textwidth=0

set makeprg=php\ -l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" For Pheb
nnoremap <silent> <F6> :!./manage test %<CR>
