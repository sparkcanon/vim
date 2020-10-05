" Purpose: Makery set up

let s:eslint_efm = '%-P%f,%\\s%#%l:%c\ %#\ %trror\ \ %m,%\\s%#%l:%c\ %#\ %tarning\ \ %m,%-Q,%-G%.%#,'

" Desc: Makery config global {{{
let g:makery_config = {
			\   '~/Documents/work_projects/tesco/lego-web/': {
			\     'Lint': { 
			\         'makeprg': './node_modules/.bin/eslint --format stylish',
			\         'errorformat': s:eslint_efm,
			\     },
			\     'Fix': {
			\         'makeprg': './node_modules/.bin/eslint --fix',
			\         'errorformat': s:eslint_efm,
			\     },
			\     'Tags': { 'makeprg': 'ctags .' },
			\     'Test': {
			\         'makeprg': './node_modules/.bin/jest',
			\         'errorformat': '%-G%[%^\ ]%.%#,%-G%.%#Test\ suite\ failed\ to\ run,%E%.%#SyntaxError:\ %f:\ %m\ (%l:%c),%E%.%#●\ %m,%Z%.%#at\ %.%#\ (%f:%l:%c),%C%.%#,%-G%.%#',
			\     },
			\     'Tsc': {
			\         'makeprg': './node_modules/.bin/tsc --noEmit --jsx react',
			\         'errorformat': '%E%f\ %#(%l\\,%c):\ %trror\ TS%n:\ %m,%W%f\ %#(%l\\,%c):\ %tarning\ TS%n:\ %m,',
			\     },
			\     'Less' : {
			\         'makeprg': './web/node_modules/.bin/lesshint assets/styles components/ -r lesshint-reporter-stylisher', 
			\         'errorformat' : s:eslint_efm,
			\     },
			\   },
			\   '~/Documents/work_projects/tesco/peas/': {
			\     'Lint': { 
			\         'makeprg': './node_modules/.bin/eslint --format stylish',
			\         'errorformat': s:eslint_efm, 
			\     },
			\     'Fix': {
			\         'makeprg': './node_modules/.bin/eslint --fix',
			\         'errorformat': s:eslint_efm, 
			\     },
			\     'Tags': { 'makeprg': 'ctags .' },
			\     'Test': {
			\         'makeprg': './node_modules/.bin/jest',
			\         'errorformat': '%-G%[%^\ ]%.%#,%-G%.%#Test\ suite\ failed\ to\ run,%E%.%#SyntaxError:\ %f:\ %m\ (%l:%c),%E%.%#●\ %m,%Z%.%#at\ %.%#\ (%f:%l:%c),%C%.%#,%-G%.%#' 
			\      },
			\   },
			\   '~/.vim/' : {
			\     'Lint': {
			\        'makeprg': 'vint --style',
			\        'errorformat': '%f:%l:%c: %m',
			\      }
			\   }
			\ }
" }}}

finish
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

" vim:foldmethod=marker
