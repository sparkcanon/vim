" Purpose: Set elm settings

" Load elm-vim package
packadd vim-elm-syntax

" Make
compiler elm-make

" Format
set formatprg=elm-format\ --stdin\ --yes 
set formatexpr=

" format buffer
nnoremap gQ mlgggqG'l :delm l<CR>
