" Purpose: send text to terminal
" Source: https://stackoverflow.com/a/49366558/1390749

augroup send_to_term
	autocmd!
	autocmd TerminalOpen * if &buftype ==# 'terminal' |
				\   let t:send_to_term = +expand('<abuf>') |
				\ endif
augroup END

" Desc: selected text to register
function! s:op(type, ...) abort
	let [sel, rv, rt] = [&selection, @@, getregtype('"')]
	let &selection = "inclusive"

	if a:0 
		silent exe "normal! `<" . a:type . "`>y"
	elseif a:type == 'line'
		silent exe "normal! '[V']y"
	elseif a:type == 'block'
		silent exe "normal! `[\<C-V>`]y"
	else
		silent exe "normal! `[v`]y"
	endif

	call s:send_to_term(@@)

	let &selection = sel
	call setreg('"', rv, rt)
endfunction

" Desc: send the text to terminal
function! s:send_to_term(keys) abort
	let bufnr = get(t:, 'send_to_term', 0)
	if bufnr > 0 && bufexists(bufnr) && getbufvar(bufnr, '&buftype') ==# 'terminal'
		let keys = substitute(a:keys, '\n$', '', '')
		call term_sendkeys(bufnr, keys . "\<cr>")
		echo "Sent " . len(keys) . " chars -> " . bufname(bufnr)
	else
		echom "Error: No terminal"
	endif
endfunction

function! repl_utils#RunTerminalCommand(cmd, mod) abort
	execute a:mod . ' term ' . a:cmd
endfunction

command! -range -bar SendToTerm call s:send_to_term(join(getline(<line1>, <line2>), "\n"))
nmap <script> <Plug>(send-to-term-line) :<c-u>SendToTerm<cr>
nmap <script> <Plug>(send-to-term) :<c-u>set opfunc=<SID>op<cr>g@
xmap <script> <Plug>(send-to-term) :<c-u>call <SID>op(visualmode(), 1)<cr>

