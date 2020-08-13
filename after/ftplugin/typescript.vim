" Purpose: Typescript settings

" Desc: js omnifunc
setlocal omnifunc=javascriptcomplete#CompleteJS

" Tsc error format
set errorformat+=%E\ %#%f\ %#(%l\\,%c):\ error\ %m
set errorformat+=%W\ %#%f\ %#(%l\\,%c):\ warning\ %m

" Desc: Source js file as its all the bloody same
source <sfile>:h/javascript.vim
