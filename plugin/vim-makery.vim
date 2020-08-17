" Purpose: Makery set up

let g:makery_config = {
\   "~/Documents/work_projects/tesco/lego-web/": {
\     "Lint": { "compiler": "Eslint" },
\     "Fix": { "compiler": "Eslint-fix" },
\     "Tags": { "makeprg": "ctags ." },
\     "Test": { "compiler": "jest" },
\     "Tsc": { "compiler": "Tsc" },
\   },
\   "~/Documents/work_projects/tesco/peas/": {
\     "Lint": { "compiler": "Eslint" },
\     "Fix": { "compiler": "Eslint-fix" },
\     "Tags": { "makeprg": "ctags ." },
\     "Test": { "compiler": "jest" },
\   }
\ }
