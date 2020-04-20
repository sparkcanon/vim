"  _______ 
" < VIMRC >
"  ------- 
"        \   ^__^
"         \  (**)\_______
"            (__)\       )\/\
"             U  ||----w |
"                ||     ||

" Reset augroup {{{
augroup GeneralSettings
	autocmd!
augroup END
" }}}

" Syntax {{{
filetype plugin indent on
syntax enable
" }}}

" Completion {{{
setglobal completeopt+=menuone,noinsert,longest  " Open menu and no insert
set omnifunc=syntaxcomplete#Complete             " General purpose omnifunc
" }}}

" Basic Settings {{{
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
setglobal switchbuf=useopen                            " Vert split window for qf entries

" Case
setglobal smartcase                                    " To ignore case in certain cases, overrides ignorecase
setglobal ignorecase                                   " Ignore case all together

" Wild menu options
setglobal wildmenu                                     " Turn menu on for wild searches
setglobal wildignorecase                               " Ignore case for wildmenu
setglobal wildignore=*.swp,*.bak                       " Ignore files
setglobal wildignore+=*.cache,*.min.*,**/dist/**
setglobal wildignore+=**/.git/**/*
setglobal wildignore+=*-lock.json

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

" Statusline
setglobal laststatus=2                                 " Display statusline
setglobal statusline=\ ❮\ %<%f
setglobal statusline+=\ %{utils#locListErrorCount()}
setglobal statusline+=\%h%m%r%=%-14.(%l,%c%V%)\%P\ ❯\ 

" Grep
if executable('rg')
	setglobal grepprg=rg\ --column\ --no-heading\ --smart-case\ --follow\ --vimgrep
	setglobal grepformat=%f:%l:%c:%m
endif
" }}}

" Mappings {{{
" Commands
nnoremap ; :
nnoremap : ;

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
" Tab movement in pum
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Tags
nnoremap ,p :ptjump<space><C-R><C-W><CR>
nnoremap ,t :tjump<space><C-R><C-W><CR>
nnoremap ,v :vert stjump<space><C-R><C-W><CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>

" Center search result line in screen
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # #zvzz
nnoremap `` ``zz

" Location list
nnoremap <Up> :lopen<CR>
nnoremap <Down> :lclose<CR>
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
nnoremap ]<C-L> :lnfile<CR>
nnoremap [<C-L> :lpfile<CR>

" Quickfix list
nnoremap <Left> :copen<CR>
nnoremap <Right> :cclose<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap ]<C-F> :cnfile<CR>
nnoremap [<C-F> :cpfile<CR>

" Tabularize
xnoremap ga :Tabularize /
xnoremap ga" :Tabularize / ".*<CR>
nnoremap ga :Tabularize /

" Buffers
" previously used buffer
nnoremap <BS> <C-^>
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>

" Args
nnoremap ]a :next<CR>
nnoremap [a :previous<CR>

" Substitute
nnoremap <Bslash>s :%s/<C-r><C-w>/
xnoremap <Bslash>s <Esc>:%s/<C-R><C-R>=utils#getVisualSelection()<CR>/

" CFDO
nnoremap <Bslash>c :cfdo %s/<C-r><C-w>//g <Bar> update<S-Left><Left><Left><Left><Left><Left>
xnoremap <Bslash>c :cfdo %s/<C-R><C-R>=utils#getVisualSelection()<CR>//gc <Bar> update<S-Left><S-Left><Left><Left><Left><Left>

" Lists
cnoremap <expr> <CR> listcommands#CR()
nnoremap <Bslash>F :global //#<left><left>
nnoremap <Bslash>f :global /<C-R><C-W>/#

" Empty lines
nnoremap ]<space> o<C-c>
nnoremap [<space> O<C-c>

" Find
nnoremap <space>f :find<space>
nnoremap <space>c :Cfind<space>
nnoremap <space>s :sfind<space>
nnoremap <space>v :vert sfind<space>
nnoremap <space>t :tabfind<space>
nnoremap <space>ee :e <C-R>='%:h/'<CR>
nnoremap <space>ev :vsp <C-R>='%:h/'<CR>
nnoremap <space>es :sp <C-R>='%:h/'<CR>
" }}}

" Colors {{{
" Modify buffer colors
autocmd GeneralSettings ColorScheme * call colors#modifyBufferColors()

" Highlights git diff markers
autocmd GeneralSettings ColorScheme * match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set termguicolors " set 24bit colors

" Set color scheme after setting buffer colors
packadd molokai " Load colorscheme
colorscheme molokai
set background=dark
" }}}

" Misc Autocmd {{{
" Preview window close
autocmd GeneralSettings CompleteDone * silent! pclose
autocmd GeneralSettings CursorMoved * silent! pclose

" Create a new dir if it doesnt exists
autocmd GeneralSettings BufWritePre *
			\ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
			\ call mkdir(expand('<afile>:h'), 'p') |
			\ endif

" Auto-resize splits when Vim gets resized.
autocmd GeneralSettings VimResized * wincmd =

" Save session on exit
autocmd GeneralSettings VimLeave * call sessions#sessionSave()

" Set path
autocmd GeneralSettings BufEnter * call project_utils#setProjectPath()

" Set GLCD
autocmd GeneralSettings BufEnter * 
			\ if finddir('.git', '.;') == ".git" |
			\ execute 'Glcd' |
			\ endif

" Make on save
autocmd GeneralSettings BufWritePost *.js,*.jsx,*.ts,*.tsx silent lmake! <afile> | silent redraw!

" Run ctags if git exists
autocmd GeneralSettings BufWritePost * 
			\ if finddir('.git', '.;') == ".git" |
			\ execute 'Dispatch! ctags .' |
			\ endif

" Set up formatprg, formatexpr
autocmd GeneralSettings FileType typescript,typescriptreact call
			\ format_utils#setFormatPrg()
" }}}

" Commands {{{
" Grep for quickfix list
command! -nargs=+ -complete=file -bar Grep cgetexpr utils#grep(<q-args>)
" Grep for quickfix list
command! -nargs=0 -bar GrepWord execute 'Grep '.expand('<cword>')
" Last grep
command! -nargs=0 GrepLast execute 'Grep '.@/.' %'
" Grep buffer
command! -nargs=0 GrepBuffer execute 'Grep '.expand('<cword>').' %'

" Save sessions (force)
command! -nargs=0 SessionSave call sessions#sessionSave()
" Load sessions
command! -nargs=1 -complete=customlist,sessions#sessionCompletePath
			\ SessionLoad call sessions#sessionLoad(<q-args>)

" Yank paths
" Relative path
command! -nargs=0 YRelative call yank#yankPath("relative")
" Full path
command! -nargs=0 YAbsolute call yank#yankPath("full")
" Filename
command! -nargs=0 Yfname call yank#yankPath("filename")
" Filename
command! -nargs=0 Ydirectory call yank#yankPath("directory")

" Make on all open buffers
command! -nargs=0 MassMake call utils#massMake()
" }}}

" Abbr {{{
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
call utils#setupCommandAbbrs('gr','Grep')
call utils#setupCommandAbbrs('grl','GrepLast')
call utils#setupCommandAbbrs('grb','GrepBuffer')
call utils#setupCommandAbbrs('grw','GrepWord')

" Git
call utils#setupCommandAbbrs('gp','Dispatch! git push')
call utils#setupCommandAbbrs('gl','Dispatch! git pull')
" }}}

" Plugins {{{
packloadall!      " Load all plugins
packadd! cfilter  " Filter results from qf lists
packadd! matchit  " Jump to brackets

" Netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Dispatch: https://github.com/tpope/vim-dispatch/issues/222#issuecomment-442885769
setglobal shellpipe=2>&1\|tee
" }}}
