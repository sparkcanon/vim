" Purpose: Ctags runner

" Desc: Ctags job {{{
function! ctags#runner() abort
	if finddir('.git', '.;') == ".git"
		let l:gen_ctags = 'fd tags.lock . --change-older-than 2min -d 1 --no-ignore -x rm {} tags \;
					\ && [ ! -f tags.lock ] && touch tags.lock
					\ && ctags .
					\ && rm -rf tags.lock'
		call job_start([&shell, &shellcmdflag, l:gen_ctags], {
					\ "in_io": "null", 
					\ "out_io": "null", 
					\	"err_io": "null"
					\ })
	endif
endfunction
" }}}

