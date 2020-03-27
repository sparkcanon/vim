" Purpose: Utils for includeexpr function PathSubstitue

" Desc: Build string for relative paths
" Params: fname - v:fname comes through includeexpr, PathSubstitue
" Params: modifier - stabalize the path
function! fname#Build_glob_string_from_relative_fname(fname, modifier)
    return ''
        \ . expand('%:.:h' . a:modifier) . '/'
        \ . matchstr(a:fname, '\(\(\.\)\+/\)\+\zs.*')
        \ . '{/' . split(a:fname, '/')[-1] . ',/index}'
        \ . '.{' . substitute(&suffixesadd, '\.', '', 'g') . '}'
endfunction

" Desc: Build string for aliased paths
" Params: fname - v:fname comes through includeexpr, PathSubstitue
function! fname#Build_glob_string_from_aliased_fname(fname)
    return ''
        \ . a:fname
        \ . '{/' . split(a:fname, '/')[-1] . ',/index,}'
        \ . '.{' . substitute(&suffixesadd, '\.', '', 'g') . '}'
endfunction
