" Desc: Personal Vim configuration
" Author: Pratik Borde
"  _______ 
" < VIMRC >
"  ------- 
"        \   ^__^
"         \  (**)\_______
"            (__)\       )\/\
"             U  ||----w |
"                ||     ||

" Reset augroup {{{
augroup GeneralAutocmds
	autocmd!
augroup END
augroup FileTypeAutocmd
	autocmd!
augroup END
augroup MarksAutocmd
	autocmd!
augroup END
augroup ColorsAutocmd
	autocmd!
augroup END
augroup MkdirAutocmd
	autocmd!
augroup END
augroup MakeAutocmd
	autocmd!
augroup END
" }}}

" Section: Syntax {{{
filetype plugin indent on
syntax enable
" }}}

" Section: Completion {{{
setglobal completeopt+=menuone,noinsert,longest  " Open menu and no insert
set omnifunc=syntaxcomplete#Complete             " General purpose omnifunc
" }}}

" Section: Basic Settings {{{
set number                                             " Display number line
setglobal backspace=indent,eol,start                   " Normal backspace behaviour
setglobal hidden                                       " Display hidden buffers in list
setglobal autoread                                     " Update file if changed outside
setglobal incsearch                                    " Turn on incremental search
setglobal hlsearch                                     " Highlight search term
setglobal showmatch                                    " Highlight matching paranthesis
setglobal wrap                                         " Wrap long lines
setglobal autoindent                                   " Minimal auto indenting for any filetype
setglobal clipboard+=unnamed                           " Set clipboard options

" Splits
setglobal splitbelow                                   " Split window opens below
setglobal splitright                                   " Split window opens right

" Case
setglobal smartcase                                    " To ignore case in certain cases, overrides ignorecase
setglobal ignorecase                                   " Ignore case all together

" Wild menu options
setglobal wildmenu                                     " Turn menu on for wild searches
setglobal wildignorecase                               " Ignore case for wildmenu
setglobal wildignore=*.swp,*.bak                       " Ignore files
setglobal wildignore+=*.cache,*.min.*,**/dist/**
setglobal wildignore+=**/.git/**/*
setglobal wildignore+=*-lock.json,*.snap

" Make
set makeef=errorfile.vim

" Set fd error format
set errorformat+=%f

" Path options
setglobal path=.,,**                                   " Standard path

" Backup settings
setglobal sessionoptions-=options
setglobal viewoptions-=options
set undofile                                           " Set this option to have full undo power
setglobal backup                                       " Set this option to enable backup
setglobal writebackup                                  " Set this option to write back up
setglobal backupdir=$HOME/.vim/tmp/dir_backup//        " Back up dir
setglobal directory^=$HOME/.vim/tmp/dir_swap//         " Swap file dir
setglobal undodir=$HOME/.vim/tmp/dir_undo              " Undo dir

" List chars
set lcs=trail:·,eol:¬,tab:│\ 
set list

" Statusline
set laststatus=0                                 " Dont display statusline
set ruler                                        " Display ruler
set rulerformat=%45(%t\ ❯\ %l,%c%V%=%P%)             " Display filename in ruler

" Grepprg & grepformat
if executable('rg')
	setglobal grepprg=rg\ --vimgrep
	setglobal grepformat=%f:%l:%c:%m
endif
" }}}

" Section: Mappings {{{
" Enter Commands mode
set iminsert=1
for mode in ['n', 'x']
  execute mode . 'noremap  : ;'
  execute mode . 'noremap  ; :'
endfor

" Using backtick for marks drops you on the exact column
nnoremap ` '
nnoremap ' `

" Completion
" Tag completion
inoremap <C-]> <C-x><C-]>
" Omni completion
inoremap <C-k> <C-x><C-o>
" Keyword completion
inoremap <C-n> <C-x><C-n>
" File name completion
inoremap <C-f> <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
" Line completion
inoremap <C-l> <C-x><C-l>
" Spell completion
inoremap <C-d> <C-x><C-s>
" Tab movement in pum
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Tags
nnoremap ,p :ptjump<space><C-R><C-W><CR>
nnoremap ,j :tjump<space><C-R><C-W><CR>
nnoremap ,t :tab<space>tjump<space><C-R><C-W><CR>
nnoremap ,v :vert stjump<space><C-R><C-W><CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Terminal
tnoremap <Esc> <C-\><C-n>

" Center search result line in screen
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # #zvzz
nnoremap `` ``zz

" Location list
nnoremap <Up> :call togglelist#ToggleList('Location List', 'l')<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
nnoremap ]<C-L> :lnfile<CR>
nnoremap [<C-L> :lpfile<CR>

" Quickfix list
nnoremap <Down> :call togglelist#ToggleList('Quickfix List','c')<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap ]<C-F> :cnfile<CR>
nnoremap [<C-F> :cpfile<CR>

" Buffers
" previously used buffer
nnoremap <BS> <C-^>
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>

" Args
nnoremap ]a :next<CR>
nnoremap [a :previous<CR>

" Substitute
nnoremap <Bslash>s :%s/\v<<C-r><C-w>>/
xnoremap <Bslash>s <Esc>:%s/<C-R><C-R>=utils#getVisualSelection()<CR>/

" Global
nnoremap <Bslash>g :g//#<Left><Left>

" CFDO
nnoremap <Bslash>c :cfdo! %s/<C-r><C-w>//g <Bar> update<S-Left><Left><Left><Left><Left><Left>
" xnoremap <Bslash>c :cfdo %s/<C-R><C-R>=utils#getVisualSelection()<CR>//gc <Bar> update<S-Left><S-Left><Left><Left><Left><Left> FIXME: This mapping is broken

" Lists
cnoremap <expr> <CR> listcommands#CR()
nnoremap <Bslash>F :global //#<left><left>
nnoremap <Bslash>f :global /<C-R><C-W>/#

" New lines
nnoremap ]<space> o<C-c>
nnoremap [<space> O<C-c>

" Find
nnoremap <space>f :find<space>
nnoremap <space>c :Cfind<space>
nnoremap <space>s :sfind<space>
nnoremap <space>v :vert sfind<space>
nnoremap <space>t :tabfind<space>

" Edit
nnoremap <space>ee :e <C-R>='%:h/'<CR>
nnoremap <space>ev :vsp <C-R>='%:h/'<CR>
nnoremap <space>es :sp <C-R>='%:h/'<CR>
" }}}

" Section: Colors {{{
" Modify buffer colors
autocmd ColorsAutocmd ColorScheme * call color_utils#modifyBufferColors()

" Highlights git diff markers
autocmd ColorsAutocmd ColorScheme * match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" For some color schemes set termguicolors and for some others set t_Co=256
set t_Co=256
set background=dark
colorscheme iceberg " Set color scheme after setting buffer colors
" }}}

" Section: General auto commands {{{
" Preview window close
autocmd GeneralAutocmds CompleteDone * silent! pclose
autocmd GeneralAutocmds CursorMoved * silent! pclose

" Create a new dir if it doesnt exists
autocmd MkdirAutocmd BufNewFile * call utils#mkdir(expand('<afile>:p:h'))

" Auto-resize splits when Vim gets resized.
autocmd GeneralAutocmds VimResized * wincmd =

" Save session on exit
autocmd GeneralAutocmds VimLeavePre * call sessions#sessionSave()

" Set path
autocmd GeneralAutocmds BufEnter,BufAdd * call path_job#setProjectPath()

" Run ctags as a job
autocmd GeneralAutocmds BufWritePost * call utils#RunCtags()

" Leave marks on BufLeave
autocmd MarksAutocmd BufLeave *.css,*.scss,*.less normal! mC
autocmd MarksAutocmd BufLeave *.html              normal! mH
autocmd MarksAutocmd BufLeave *.js,*.ts,*.tsx     normal! mJ
autocmd MarksAutocmd BufLeave *.yml,*.yaml        normal! mY
autocmd MarksAutocmd BufLeave .env*               normal! mE
autocmd MarksAutocmd BufLeave *.md                normal! mM

" Set up format prg
let s:formatprg_for_filetype = {
			\ "css"             : "prettier --stdin-filepath %",
			\ "less"            : "prettier --stdin-filepath %",
			\ "go"              : "gofmt",
			\ "html"            : "prettier --stdin-filepath %",
			\ "javascript"      : "prettier --stdin-filepath %",
			\ "typescript"      : "prettier --stdin-filepath %",
			\ "typescriptreact" : "prettier --stdin-filepath %",
			\ "json"            : "prettier --stdin-filepath %",
			\ }

for [ft, fp] in items(s:formatprg_for_filetype)
	execute "autocmd FileTypeAutocmd FileType " . ft . " let &l:formatprg=\"" . fp . "\" | setlocal formatexpr="
endfor

autocmd FileTypeAutocmd FileType css,javascript,typescript,typescriptreact,json,less nnoremap gQ mlgggqG'l :delm l<CR>

" Make autocmds
autocmd MakeAutocmd QuickFixCmdPost lmake let g:LastError = readfile(&makeef)
autocmd MakeAutocmd QuickFixCmdPre  lmake wall
autocmd MakeAutocmd QuickFixCmdPost lmake call setloclist(
			\ winnr(), 
			\ filter(getloclist(winnr()), 
			\ "v:val['valid']"), 'r'
			\ )
" }}}

" Section: Custom commands {{{
" Grep for quickfix list
command! -nargs=+ -complete=file_in_path Grep cgetexpr utils#grep(<q-args>)
" Grep word under the cursor
command! -nargs=0 -bar GrepV execute 'Grep ' . expand('<cword>')
" Grep word under the cursor excluding test files
command! -nargs=0 -bar GrepVT execute "Grep '" . expand('<cword>') . "' -F -g !'{*spec.*,*test.*}'"
" Manual grep for current buffer
command! -nargs=1 -bar GrepBuffer execute 'Grep ' . <q-args> . ' ' . expand('%')
" Last grep
command! -nargs=0 GrLast execute 'Grep ' . @/ . ' %'

" Save sessions (force)
command! -nargs=0 SessionSave call sessions#sessionSave()
" Load sessions
command! -nargs=1 -complete=customlist,sessions#sessionCompletePath
			\ SessionLoad execute 'source $HOME/.vim/tmp/dir_session/<args>'

" Yank paths
" Relative path
command! -nargs=0 YRelative call yank#yankPath("relative")
" Full path
command! -nargs=0 YAbsolute call yank#yankPath("full")
" Filename
command! -nargs=0 Yfname call yank#yankPath("filename")
" Filename
command! -nargs=0 Ydirectory call yank#yankPath("directory")

" Dirvish commands
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

" Make commands
command! -nargs=* -complete=file -bar Lint call make#runMakery('Lint', <f-args>)
command! -nargs=* -complete=file -bar Fix call make#runMakery('Fix', <f-args>)
command! -nargs=* -complete=file -bar Test call make#runMakery('Test', <f-args>)
command! -nargs=0 -complete=file -bar ErrPrint call make#Print()

" Find files and add to quickfix list
command! -nargs=* FdFiles cgetexpr system('fd -g "' . <q-args> . '" -E "*.snap" -E "test"')
" }}}

" Section: Custom abbr {{{
" Write
call utils#setupCommandAbbrs('w','update')
call utils#setupCommandAbbrs('nw','noautocmd update')
call utils#setupCommandAbbrs('ngw','noautocmd Gw')

" Source vimrc
call utils#setupCommandAbbrs('sov','source $MYVIMRC')

" Buffer list
call utils#setupCommandAbbrs('lv','ls\<space>t\<CR>:vert\<space>sb')
call utils#setupCommandAbbrs('lt','ls\<space>t\<CR>:tab\<space>sb')
call utils#setupCommandAbbrs('ld','ls\<space>t\<CR>:bd')
call utils#setupCommandAbbrs('bD','bp\<bar>bd#')

" Session
call utils#setupCommandAbbrs('ssl','SessionLoad')
call utils#setupCommandAbbrs('ssa','SessionSave')

" Grep
call utils#setupCommandAbbrs('fr','Grep')
call utils#setupCommandAbbrs('fb','GrepBuffer' )
call utils#setupCommandAbbrs('fv','GrepV')
call utils#setupCommandAbbrs('ft','GrepVT')
call utils#setupCommandAbbrs('fd','FdFiles')

" Git
call utils#setupCommandAbbrs('gf','term git fetch --all')
call utils#setupCommandAbbrs('gp','term git push')
call utils#setupCommandAbbrs('gl','Git pull')
call utils#setupCommandAbbrs('gd','Git difftool')
call utils#setupCommandAbbrs('gm','Git mergetool')
" }}}

" Section: Plugins && related setup {{{
packloadall       " Load all plugins
packadd! cfilter  " Filter results from qf lists
packadd! matchit  " Jump to brackets

" Disable netrw
let loaded_netrwPlugin = 1
" }}}

" vim:foldmethod=marker
