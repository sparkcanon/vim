" Purpose: include-search, define-search settings, path and JS specific
" commands

" Useful for include-search e.g., [I
setlocal suffixesadd+=.ts
setlocal suffixesadd+=.js
setlocal suffixesadd+=.jsx
setlocal suffixesadd+=.tsx
setlocal suffixesadd+=.defs

" Source: https://gist.github.com/romainl/a50b49408308c45cc2f9f877dfe4df0c#file-typescript-vim-L240
setlocal include=^\\s*[^\/]\\+\\(from\\\|require(\\)\\s*['\"\.]

" Source: https://gist.github.com/romainl/a50b49408308c45cc2f9f877dfe4df0c#file-typescript-vim-L242
let &define  = '^\s*\('
			\ . '\(export\s\)*\(default\s\)*\(var\|const\|let\|function\|class\|interface\|type\)\s'
			\ . '\|\(public\|private\|protected\|readonly\|static\)\s'
			\ . '\|\(get\s\|set\s\)'
			\ . '\|\(export\sdefault\s\|abstract\sclass\s\)'
			\ . '\|\(async\s\)'
			\ . '\|\(\ze\i\+([^)]*).*{$\)'
			\ . '\)'

" Tesco Lego stuff
source <sfile>:h/lego.vim

compiler eslint

" Make on all open buffers
command! -nargs=0 MassMake call functions#massMake()

" Console log command
command! -nargs=0 Log execute "normal oconsole.log('".expand('<cword>')
			\ . "====> ', ".expand('<cword>').")"

" Add import statement
command! -nargs=0 ImportJs execute "normal ggOimport { ".expand('<cword>')." } from '';"

" Sets import statement suffix
setlocal includeexpr=PathSubstitue(v:fname)

" Desc: includeexpr
function! PathSubstitue(fname) abort

	" Aliased
	if functions#isProject('lego-web')
		if a:fname =~ '^\#'
			" in the substitution below, the # was not escaped in the original snippet,
			" which caused all sorts of problems
			let alias_plus_fname = substitute(a:fname,'^\#/','./web/','g')
			return get(glob(fname#Build_glob_string_from_aliased_fname(alias_plus_fname), 0, 1), 0, a:fname)
		endif
	endif

	" ../
	if a:fname =~ '^\.\./'
		let modifier = substitute(matchstr(a:fname, '\(\(\.\)\+/\)\+'), '\.\./', ':h', 'g')

		if functions#isProject('lego-web') || functions#isProject('peas')
			return './' . get(glob(fname#Build_glob_string_from_relative_fname(a:fname, modifier), 0, 1), 0, a:fname)
		endif

		return get(glob(fname#Build_glob_string_from_relative_fname(a:fname, modifier), 0, 1), 0, a:fname)
	endif

	" ./
	if a:fname =~ '^\./'

		if functions#isProject('lego-web') || functions#isProject('peas')
			return './' . get(glob(fname#Build_glob_string_from_relative_fname(a:fname, ''), 0, 1), 0, a:fname)
		endif

		return get(glob(fname#Build_glob_string_from_relative_fname(a:fname, ''), 0, 1), 0, a:fname)
	endif
endfunction
