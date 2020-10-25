" Purpose: Makery set up

" Desc: Errorformats {{{
let s:eslint_efm = '%-P%f,%\\s%#%l:%c\ %#\ %trror\ \ %m,%\\s%#%l:%c\ %#\ %tarning\ \ %m,%-Q,%-G%.%#,'
let s:xo_compact_efm = '%f: line %l\, col %c\, %trror - %m,%f: line %l\, col %c\, %tarning - %m,%-G%.%#'
let s:jest_efm = '%-G%[%^\ ]%.%#,%-G%.%#Test\ suite\ failed\ to\ run,%E%.%#SyntaxError:\ %f:\ %m\ (%l:%c),%E%.%#●\ %m,%Z%.%#at\ %.%#\ (%f:%l:%c),%C%.%#,%-G%.%#'
" }}}

" Desc: Makery config global {{{
let g:makery_config = {
			\   '~/Documents/work_projects/tesco/lego-web/': {
			\     'Lint': { 
			\         'makeprg': 'npx eslint --format stylish',
			\         'errorformat': s:eslint_efm,
			\     },
			\     'Fix': {
			\         'makeprg': 'npx eslint --fix',
			\         'errorformat': s:eslint_efm,
			\     },
			\     'Tags': { 'makeprg': 'ctags .' },
			\     'Test': {
			\         'makeprg': './web/node_modules/.bin/jest',
			\         'errorformat': s:jest_efm,
			\     },
			\     'Tsc': {
			\         'makeprg': 'npx tsc --noEmit --jsx react',
			\         'errorformat': '%E%f\ %#(%l\\,%c):\ %trror\ TS%n:\ %m,%W%f\ %#(%l\\,%c):\ %tarning\ TS%n:\ %m,',
			\     },
			\     'Less' : {
			\         'makeprg': './web/node_modules/.bin/lesshint assets/styles components/ -r lesshint-reporter-stylisher', 
			\         'errorformat' : s:eslint_efm,
			\     },
			\   },
			\   '~/Documents/work_projects/tesco/peas/': {
			\     'Lint': { 
			\         'makeprg': 'npx eslint --format stylish',
			\         'errorformat': s:eslint_efm, 
			\     },
			\     'Fix': {
			\         'makeprg': 'npx eslint --fix',
			\         'errorformat': s:eslint_efm, 
			\     },
			\     'Tags': { 'makeprg': 'ctags .' },
			\     'Test': {
			\         'makeprg': 'npx jest',
			\         'errorformat': s:jest_efm 
			\      },
			\   },
			\   '~/.vim/' : {
			\     'Lint': {
			\        'makeprg': 'vint --style',
			\        'errorformat': '%f:%l:%c: %m',
			\      },
			\     'Tags': { 'makeprg': 'ctags .' },
			\   },
			\ '~/Documents/playground/pack-cli/': {
			\     'Lint': { 
			\         'makeprg': 'npx xo --reporter compact',
			\         'errorformat': s:xo_compact_efm, 
			\     },
			\     'Fix': {
			\         'makeprg': 'npx xo --fix',
			\         'errorformat': s:xo_compact_efm, 
			\     },
			\     'Tags': { 'makeprg': 'ctags .' },
			\   }
			\ }
" }}}

finish " {{{
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

