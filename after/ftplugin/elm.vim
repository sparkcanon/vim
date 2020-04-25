" Purpose: Set elm settings

" Load elm-vim package
packadd vim-elm-syntax

" let &errorformat = '%E%.%#-- %m -%# %f' . ',' .
" 			\ '%C%l\\|' . ',' .
" 			\ '%C%.%#'

" Format
set formatprg=elm-format\ --stdin\ --yes 
set formatexpr=

" format buffer
nnoremap gQ mlgggqG'l :delm l<CR>
