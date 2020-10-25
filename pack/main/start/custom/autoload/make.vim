" Purpose: Make

" Desc: Run makery with args {{{
function! make#runMakery(...) abort
	if filereadable('.makery.json')
		if a:0 == 1
			execute 'LM' . a:1 . '! ' . expand('%')
		elseif a:0 > 1
			execute 'LM' . a:1 . '! ' . expand(join(a:000[1:-1]))
		endif
	else
		echom "Error: no makery.json"
	endif
endfunction
" }}}

finish " {{{
" Desc: Errorformats
let s:eslint_efm = '%-P%f,%\\s%#%l:%c\ %#\ %trror\ \ %m,%\\s%#%l:%c\ %#\ %tarning\ \ %m,%-Q,%-G%.%#,'
let s:xo_compact_efm = '%f: line %l\, col %c\, %trror - %m,%f: line %l\, col %c\, %tarning - %m,%-G%.%#'
let s:jest_efm = '%-G%[%^\ ]%.%#,%-G%.%#Test\ suite\ failed\ to\ run,%E%.%#SyntaxError:\ %f:\ %m\ (%l:%c),%E%.%#●\ %m,%Z%.%#at\ %.%#\ (%f:%l:%c),%C%.%#,%-G%.%#'

" Lesshint stylish error sample
/Users/praborde/Documents/work_projects/tesco/lego-web/web/components/products/product-tile/carousel-tile/small.less
21:3  warning  Property ordering is not alphabetized                          propertyOrdering
29:5  warning  Property ordering is not alphabetized                          propertyOrdering
36:5  warning  Property ordering is not alphabetized                          propertyOrdering
36:18  warning  Unit should not be omitted on zero values.                             zeroUnit
45:5  warning  Property ordering is not alphabetized                          propertyOrdering
63:9  warning  Property ordering is not 

" Eslint stylish error sample
/Users/praborde/Documents/work_projects/tesco/lego-web/web/lib/requests/get-tesco-recommendations.js
2:35  error  Replace `'../recommender-helpers'` with `'../recommender-helpers'`                                          prettier/prettier
8:8   error  Replace `'./helpers/get-tesco-recommendations-helper'` with `'./helpers/get-tesco-recommendations-helper'`  prettier/prettier

" XO compact error sample
/Users/praborde/Documents/playground/pack-cli/source/cli.tsx: line 2, col 1, Error - Expected indentation of 0 spaces but found 1 tab. (@typescript-eslint/indent)
" }}}
