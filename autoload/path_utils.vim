" Purpose: Utils for includeexpr function PathSubstitue

" Desc: Build string for relative paths
" Params: fname - v:fname comes through includeexpr, PathSubstitue
" Params: modifier - stabalize the path
function! path_utils#Build_glob_string_from_relative_fname(fname, modifier)
	" build string to pass to glob()
	"     expected output:
	"         src/foo/bar{/bar,/index,*}.{js,ts}
	"     covered cases:
	"         ./foo/bar => ./foo/bar.js
	"         ./foo/bar => ./foo/bar/bar.js
	"         ./foo/bar => ./foo/bar/index.js
	"         ../../foo/bar => ../../foo/bar.js
	"         ../../foo/bar => ../../foo/bar/bar.js
	"         ../../foo/bar => ../../foo/bar/index.js
	"     components:
	"         root: expanded from './' or '../../' and '%'
	"         path: a:fname without './' or '../../'
	"         radical: last part of a:fname
	"         suffixes: expanded from &suffixes
	return ''
				\ . expand('%:.:h' . a:modifier) . '/'
				\ . matchstr(a:fname, '\(\(\.\)\+/\)\+\zs.*')
				\ . '{/' . split(a:fname, '/')[-1] . ',/index}'
				\ . '.{' . substitute(&suffixesadd, '\.', '', 'g') . '}'
endfunction

" Desc: Build string for aliased paths
" Params: fname - v:fname comes through includeexpr, PathSubstitue
function! path_utils#Build_glob_string_from_aliased_fname(fname)
	return ''
				\ . a:fname
				\ . '{/' . split(a:fname, '/')[-1] . ',/index,}'
				\ . '.{' . substitute(&suffixesadd, '\.', '', 'g') . '}'
endfunction
