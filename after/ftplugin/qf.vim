" Clear list
command! -nargs=0 Cclear call setqflist([])
command! -nargs=0 Lclear call setloclist(winnr(),[])
