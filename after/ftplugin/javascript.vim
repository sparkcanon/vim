" Purpose: JS specific include-search, define-search settings, path commands

" Section: suffixesadd, include, define, matchit, path, compiler, format util {{{
" Desc: Useful for include-search e.g., [I
setlocal suffixesadd+=.ts
setlocal suffixesadd+=.js
setlocal suffixesadd+=.jsx
setlocal suffixesadd+=.tsx

" Source: https://gist.github.com/romainl/a50b49408308c45cc2f9f877dfe4df0c#file-typescript-vim-L240
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(\\)\\s*['\"\.]

" Source: https://gist.github.com/romainl/a50b49408308c45cc2f9f877dfe4df0c#file-typescript-vim-L242
let &l:define  = '^\s*\('
      \ . '\(export\s\)*\(default\s\)*\(var\|const\|let\|function\|class\|interface\|type\)\s'
      \ . '\|\(public\|private\|protected\|readonly\|static\)\s'
      \ . '\|\(get\s\|set\s\)'
      \ . '\|\(export\sdefault\s\|abstract\sclass\s\)'
      \ . '\|\(async\s\)'
      \ . '\|\(\ze\i\+([^)]*).*{$\)'
      \ . '\)'

" Desc: Matchit words
let b:match_words = '\<function\>:\<return\>,'
      \ . '\<if\>:\<else\>,'
      \ . '\<switch\>:\<case\>:\<default\>,'
      \ . '\<do\>:\<while\>,'
      \ . '\<try\>:\<catch\>:\<finally\>,'

" Desc: Set standard javascript path
let &l:path = '.,,'
			\ . 'src/**'

" Desc: Set eslint compiler
compiler eslint

" Desc: load syntax highlighting
packadd vim-jsx-pretty
packadd yajs.vim

" Desc: Set up format prg
call format_utils#setFormatPrg()
" }}}

" Section: Commands & Mappings {{{
" Console log command
command! -nargs=0 Log execute "normal oconsole.log('".expand('<cword>')
      \ . "====> ', ".expand('<cword>').")"

command! -nargs=0 -range LogVisual execute "normal oconsole.log('". utils#getVisualSelection()
      \ . "====> ', ". utilsgetVisualSelection() .")"

" Add import statement
command! -nargs=0 ImportJs execute "normal ggOimport { ".expand('<cword>')." } from '';"

" format buffer
nnoremap gQ mlgggqG'l :delm l<CR>

" Repl
nmap yrr <Plug>(send-to-term-line)
nmap yr <Plug>(send-to-term)
xmap R <Plug>(send-to-term)
command! -nargs=* -complete=shellcmd Run call repl_utils#RunTerminalCommand(<q-args>, <q-mods>)<CR>
" }}}

" Section: Includeexpr custom function {{{
" Sets import statement suffix
setlocal includeexpr=PathSubstitue(v:fname)

" Desc: creates paths for alias and local imports @romainl
" Note: fucking hate javascript implicit rules
function! PathSubstitue(fname) abort

	" Aliased
	if a:fname =~ '^\#/'
		let l:custom_base_path = './'

		if project_utils#isProject('lego-web')
			let l:custom_base_path = './web/'
		endif

		let l:alias_fname = substitute(a:fname,'^\#/',l:custom_base_path,'g')
		let l:result =  get(glob(path_utils#Build_glob_string_from_aliased_fname(l:alias_fname), 0, 1), 0, l:alias_fname)
		if getftype(l:result) == 'dir'
			return l:result . '/index'
		else
			return l:result
		endif
	endif

	" ../
	if a:fname =~ '^\.\./'
		let l:mod = substitute(matchstr(a:fname, '\(\(\.\)\+/\)\+'), '\.\./', ':h', 'g')
		if getftype(path_utils#Build_glob_string_from_relative_fname(a:fname, l:mod)) == 'dir'
			return a:fname . '/index'
		endif
		return a:fname
	endif

	" ./
	if a:fname =~ '^\./'
		if getftype(path_utils#Build_glob_string_from_relative_fname(a:fname, '')) == 'dir'
			return a:fname . '/index'
		endif
		return a:fname
	endif

	return a:fname
endfunction
" }}}

" vim:foldmethod=marker
