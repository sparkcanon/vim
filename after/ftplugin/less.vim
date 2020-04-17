" Purpose: Less settings

" Set formatprg, formatexpr to prettier
call format_utils#setFormatPrg()

" format buffer
nnoremap gQ mlgggqG'l :delm l<CR>
