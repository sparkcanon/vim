function! fname#Build_glob_string_from_relative_fname(fname, modifier)
    return ''
        \ . expand('%:.:h' . a:modifier) . '/'
        \ . matchstr(a:fname, '\(\(\.\)\+/\)\+\zs.*')
        \ . '{/' . split(a:fname, '/')[-1] . ',/index}'
        \ . '.{' . substitute(&suffixesadd, '\.', '', 'g') . '}'
endfunction

function! fname#Build_glob_string_from_aliased_fname(fname)
    return ''
        \ . a:fname
        \ . '{/' . split(a:fname, '/')[-1] . ',/index,}'
        \ . '.{' . substitute(&suffixesadd, '\.', '', 'g') . '}'
endfunction
