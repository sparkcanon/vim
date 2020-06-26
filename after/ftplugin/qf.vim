" qf/loc list preview
nmap <buffer> p <plug>(qf-preview-open)

" Clear qf list
command! -nargs=0 Cclear call setqflist([])
