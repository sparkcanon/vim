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

" Section: Reset augroup {{{
augroup GeneralAutocmds
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
setglobal backspace=indent,eol,start                     " Normal backspace behaviour
setglobal hidden                                         " Display hidden buffers in list
setglobal autoread                                       " Update file if changed outside
setglobal incsearch                                      " Turn on incremental search
setglobal hlsearch                                       " Highlight search term
setglobal showmatch                                      " Highlight matching paranthesis
setglobal wrap                                           " Wrap long lines
setglobal autoindent                                     " Minimal auto indenting for any filetype
setglobal clipboard^=unnamed                             " Set clipboard options
set mouse=a                                              " Allow mouse interactions

" Splits
setglobal splitbelow                                     " Split window opens below
setglobal splitright                                     " Split window opens right

" Case
setglobal smartcase                                      " To ignore case in certain cases, overrides ignorecase
setglobal ignorecase                                     " Ignore case all together

" Wild menu options
setglobal wildmenu                                       " Turn menu on for wild searches
setglobal wildignorecase                                 " Ignore case for wildmenu
setglobal wildignore=*.swp,*.bak                         " Ignore files
setglobal wildignore+=*.cache,*.min.*,**/dist/**
setglobal wildignore+=**/.git/**/*
setglobal wildignore+=*-lock.json,*.snap

" Set fd error format
set errorformat+=%f                                      " Efm for fd

" Path options
setglobal path=.,,**                                     " Standard path

" Backup settings
setglobal sessionoptions-=options
setglobal viewoptions-=options
set undofile                                             " Set this option to have full undo power
setglobal backup                                         " Set this option to enable backup
setglobal writebackup                                    " Set this option to write back up
setglobal backupdir=$HOME/.vim/tmp/dir_backup//          " Back up dir
setglobal directory^=$HOME/.vim/tmp/dir_swap//           " Swap file dir
setglobal undodir=$HOME/.vim/tmp/dir_undo                " Undo dir

" List chars
set listchars=trail:·,eol:¬,tab:│\ 
set list

" Ruler
set laststatus=0
set ruler

" Grepprg & grepformat
if executable('rg')
	setglobal grepprg=rg\ --vimgrep
	setglobal grepformat=%f:%l:%c:%m
endif
" }}}

" Section: Mappings {{{
" Enter Commands mode
cmap <c-p> <Plug>CmdlineCompleteBackward
cmap <c-n> <Plug>CmdlineCompleteForward
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
inoremap <expr> <C-f> fzf#vim#complete#path('fd')
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
nnoremap [t :tNext<CR>
nnoremap ]t :tprevious<CR>
nnoremap ]T :tlast<CR>
nnoremap [T :tfirst<CR>

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
nnoremap <script> <silent> <Up> :call togglelist#ToggleList('Location List', 'l')<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
nnoremap ]<C-L> :lnfile<CR>
nnoremap [<C-L> :lpfile<CR>

" Quickfix list
nnoremap <script> <silent> <Down> :call togglelist#ToggleList('Quickfix List','c')<CR>
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
nnoremap <space>b :Buffers<CR>

" Args
nnoremap ]a :next<CR>
nnoremap [a :previous<CR>

" Substitute
nnoremap <Bslash>s :%s//

" Global
nnoremap <Bslash>g :g//#<Left><Left>

" Lists
cnoremap <expr> <CR> listcommands#CR()

" New lines
nnoremap ]<space> o<C-c>
nnoremap [<space> O<C-c>

" Find
nnoremap <space>f :Files<CR>

" Edit
nnoremap <space>ee :e <C-R>='%:h/'<CR>
nnoremap <space>ev :vsp <C-R>='%:h/'<CR>
nnoremap <space>es :sp <C-R>='%:h/'<CR>
" }}}

" Section: Colors {{{
" Modify buffer colors
autocmd GeneralAutocmds ColorScheme * call colors#modifyBufferColors()

" Highlights git diff markers
autocmd GeneralAutocmds ColorScheme * match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" For some color schemes set termguicolors and for some others set t_Co=256
set termguicolors
set background=dark
colorscheme iceberg " Set color scheme after setting buffer colors
" }}}

" Section: Auto commands {{{
" Preview window close
autocmd GeneralAutocmds CompleteDone * silent! pclose
autocmd GeneralAutocmds CursorMoved * silent! pclose

" Opens fugitive, man, help vertically if space available
autocmd GeneralAutocmds WinNew * au BufEnter * ++once
			\ if (&bt ==? 'help' || &ft ==? 'man' || &ft ==? 'fugitive')
			\     && winwidth(winnr('#')) >= 180 |
			\ exe 'wincmd ' . (&splitright ? 'L' : 'H') |
			\ endif

" Create a new dir if it doesnt exists
autocmd GeneralAutocmds BufNewFile * call utils#mkdir(expand('<afile>:p:h'))

" Auto-resize splits when Vim gets resized.
autocmd GeneralAutocmds VimResized * wincmd =

" Save session on exit
autocmd GeneralAutocmds VimLeavePre * call sessions#sessionSave()

" Set path
autocmd GeneralAutocmds BufEnter,BufAdd * call path_job#setProjectPath()

" Run ctags as a job
autocmd GeneralAutocmds BufWritePost * call ctags#runner()

" Set up format prg
autocmd GeneralAutocmds FileType javascript,typescript,typescriptreact,json,less,css call format#formatprg()

" Make autocmds
autocmd GeneralAutocmds QuickFixCmdPre  lmake wall
autocmd GeneralAutocmds QuickFixCmdPost lmake call setloclist(
			\ bufnr(), 
			\ filter(getloclist(bufnr()), 
			\ "v:val['valid']"), 'r'
			\ )

" Auto Open quick fix list
autocmd GeneralAutocmds QuickFixCmdPost cgetexpr cwindow
" }}}

" Section: Custom commands {{{
" Grep for quickfix list
command! -nargs=+ -complete=file Grep call grep#any('any', <q-args>)
" Grep word under the cursor
command! -nargs=1 GrepExact call grep#any('exact', <q-args>)
" Grep word under the cursor excluding test files
command! -nargs=1 GrepExclude call grep#any('exclude', <q-args>)
" Manual grep for current buffer
command! -nargs=1 GrepBuffer call grep#any('buffer', <q-args>)

" Save sessions (force)
command! -nargs=0 SessionSave call sessions#sessionSave()
" Load sessions
command! -nargs=0 SessionLoad call fzf#run({
			\  'source': 'fd .',
			\  'sink': 'so',
			\  'dir': '~/.vim/tmp/dir_session',
			\  'down': '20%' })

" Yank paths
" Relative path
command! -nargs=? -complete=dir YRelative :let @+ = expand("%")
command! -nargs=? -complete=dir YFilename :let @+ = expand("%:t")

" Dirvish commands
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>

" Make commands
command! -nargs=* -complete=file -bar Lint call make#runMakery('Lint', <f-args>)
command! -nargs=* -complete=file -bar Fix call make#runMakery('Fix', <f-args>)
command! -nargs=* -complete=file -bar Test call make#runMakery('Test', <f-args>)

" Find files and add to quickfix list
command! -nargs=* FdFiles cgetexpr system('fd -g "' . <q-args> . '" -E "*.snap" -E "test"')

" Load tabular and align
command! -nargs=* -bang -range Tabularize packadd tabular <bar> Tabularize <args>

" Npm scripts
command! -nargs=0 Npm call npm#scripts()

" List of jest tests
command! -nargs=0 JestList call jest#list()
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
call utils#setupCommandAbbrs('sr','Grep')
call utils#setupCommandAbbrs('sb','GrepBuffer' )
call utils#setupCommandAbbrs('se','GrepExact')
call utils#setupCommandAbbrs('st','GrepExclude')
call utils#setupCommandAbbrs('fd','FdFiles')

" Git
call utils#setupCommandAbbrs('gf','!git fetch --all')
call utils#setupCommandAbbrs('gp','!git push')
call utils#setupCommandAbbrs('gl','Git pull')
call utils#setupCommandAbbrs('gd','Git difftool')
call utils#setupCommandAbbrs('gm','Git mergetool')
" }}}

" Section: Plugins && related setup {{{
" Load external lugins
packadd! vim-lsc

" Load built-in optional plugins
packadd! cfilter  " Filter results from qf lists
packadd! matchit  " Jump to brackets

" Disable netrw
let loaded_netrwPlugin = 1

" Fzf
set runtimepath+=/usr/local/opt/fzf
" }}}

" vim:foldmethod=marker
