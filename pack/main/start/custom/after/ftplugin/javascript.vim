" Purpose: js,jsx specific settings

" Mappings
call utils#js_mappings()

" Useful for include-search e.g., [I
setlocal suffixesadd+=.ts,.tsx
setlocal isfname+=@-@,#-#

" Make Vim recognize ES6 import statements
let &l:include = 'from\|require'
let &l:includeexpr="substitute(v:fname,'^\#','web','')"

" Make Vim use ES6 export statements as define statements
let &l:define = '\v(export\s+(default\s+)?)?(var|let|const|(async\s+)?function|class)|export\s+'

" Matchit words
let b:match_words = '\<function\>:\<return\>,'
			\ . '\<if\>:\<else\>,'
			\ . '\<switch\>:\<case\>:\<default\>,'
			\ . '\<do\>:\<while\>,'
			\ . '\<try\>:\<catch\>:\<finally\>,'

let b:match_words .= '<:>,' .
			\ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
			\ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
			\ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
