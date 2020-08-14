" qf/loc list preview
nmap <buffer> p <plug>(qf-preview-open)

" Clear list
command! -nargs=0 Cclear call setqflist([])
command! -nargs=0 Lclear call setloclist(winnr(),[])
