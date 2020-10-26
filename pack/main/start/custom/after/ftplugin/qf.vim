" Purpose: Quickfix & Location list settings

" Desc: Commands {{{
" Clear list
command! -nargs=0 Cclear call setqflist([]) | cclose | exe 'MarkifyClear'
command! -nargs=0 Lclear call setloclist(winnr(),[]) | lclose | exe 'MarkifyClear'
" }}}

