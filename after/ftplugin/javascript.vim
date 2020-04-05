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

" Set eslint compiler
compiler eslint

" Commands {{{
" Console log command
command! -nargs=0 Log execute "normal oconsole.log('".expand('<cword>')
      \ . "====> ', ".expand('<cword>').")"

" Add import statement
command! -nargs=0 ImportJs execute "normal ggOimport { ".expand('<cword>')." } from '';"

" Run jest test watcher
command! -nargs=1 -complete=file JestSingleFile call functions#jestRunForSingleFile()

" format buffer
nnoremap gQ mlgggqG'l :delm l<CR>
" }}}

" Includeexpr {{{
" Sets import statement suffix
setlocal includeexpr=PathSubstitue(v:fname)

" Desc: creates paths for alias and local imports @romainl
" Note: fucking hate javascript implicit rules
function! PathSubstitue(fname) abort
	let custom_alias = '#'
	let custom_base_path = './web/'

  " Aliased
	if functions#isProject('lego-web') && a:fname =~ '^\' . custom_alias
		let alias_plus_fname = substitute(a:fname,'^\#/',custom_base_path,'g')
		return get(glob(fname#Build_glob_string_from_aliased_fname(alias_plus_fname), 0, 1), 0, a:fname)
	endif

  " ../
  if a:fname =~ '^\.\./'
    let modifier = substitute(matchstr(a:fname, '\(\(\.\)\+/\)\+'), '\.\./', ':h', 'g')

		" Project specific
    if functions#isProject('lego-web') || functions#isProject('peas')
      return './' . get(glob(fname#Build_glob_string_from_relative_fname(a:fname, modifier), 0, 1), 0, a:fname)
    endif

		" Standard output
    return get(glob(fname#Build_glob_string_from_relative_fname(a:fname, modifier), 0, 1), 0, a:fname)
  endif

  " ./
  if a:fname =~ '^\./'

		" Project specific
    if functions#isProject('lego-web') || functions#isProject('peas')
      return './' . get(glob(fname#Build_glob_string_from_relative_fname(a:fname, ''), 0, 1), 0, a:fname)
    endif

		" Standard output
    return get(glob(fname#Build_glob_string_from_relative_fname(a:fname, ''), 0, 1), 0, a:fname)
  endif
endfunction
" }}}
