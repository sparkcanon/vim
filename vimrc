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
set completeopt+=menuone,noinsert,longest  " Open menu and no insert
set omnifunc=syntaxcomplete#Complete       " General purpose omnifunc
" }}}

" Basic Settings {{{
set backspace=indent,eol,start             " Normal backspace behaviour
set number                                 " Display number line
set hidden                                 " Display hidden buffers in list
set signcolumn&                            " Display sign column
set autoread                               " Update file if changed outside
set incsearch                              " Turn on incremental search
set hlsearch                               " Highlight search term
set showmatch                              " Highlight matching paranthesis
set wrap                                   " Wrap long lines
set autoindent                             " Minimal auto indenting for any filetype
set clipboard+=unnamed                     " Set clipboard options
set cursorline

" Splits
set splitbelow                             " Split window opens below
set splitright                             " Split window opens right
set switchbuf=useopen                      " Vert split window for qf entries

" Case
set smartcase                              " To ignore case in certain cases, overrides ignorecase
set ignorecase                             " Ignore case all together

" Wild menu options
set wildmenu                               " Turn menu on for wild searches
set wildignorecase                         " Ignore case for wildmenu
set wildignore=*.swp,*.bak                 " Ignore files
set wildignore+=**/node_modules/**
set wildignore+=*.cache,*.min.*
set wildignore+=*/.git/**/*
set wildignore+=tags
set wildignore+=*-lock.json
set wildignore+=*.tar.*

" Path options
set path-=/usr/include                     " Exclude /usr/include dir
set path-=**/node_modules/**               " Exclude the blackhole
set path-=**/.git/**                       " Exclude the git
set path=.,,**                             " Standard inclusion

" Backup settings
set sessionoptions-=options
set viewoptions-=options
set undofile                               " Set this option to have full undo power
set backup                                 " Set this option to enable backup
set writebackup                            " Set this option to write back up
set backupdir=$HOME/.vim/tmp/dir_backup//  " Back up dir
set directory^=$HOME/.vim/tmp/dir_swap//   " Swap file dir
set undodir=$HOME/.vim/tmp/dir_undo        " Undo dir

" Statusline
set laststatus=2                           " Display statusline
set ruler                                  " Set ruler in statusline
set statusline=\ ❮\ %<%f\%h%m%r%=%-14.(%l,%c%V%)\%P\ ❯\ 

" Grep
if executable('rg')
	set grepprg=rg\ --column\ --no-heading\ --smart-case\ --follow\ --vimgrep
	set grepformat=%f:%l:%c:%m
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

" Tags mappings
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
nnoremap ]L :lfirst<CR>
nnoremap [L :llast<CR>
nnoremap ]<C-L> :lnfile<CR>
nnoremap [<C-L> :lpfile<CR>

" Quickfix list
nnoremap <Left> :copen<CR>
nnoremap <Right> :cclose<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap ]Q :cfirst<CR>
nnoremap [Q :clast<CR>
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
xnoremap <Bslash>s <Esc>:%s/<C-R><C-R>=functions#getVisualSelection()<CR>/

" CFDO
nnoremap <Bslash>c :cfdo %s/<C-r><C-w>//g <Bar> update<S-Left><Left><Left><Left><Left><Left>
xnoremap <Bslash>c :cfdo %s/<C-R><C-R>=functions#getVisualSelection()<CR>//gc <Bar> update<S-Left><S-Left><Left><Left><Left><Left>

" Lists
cnoremap <expr> <CR> listcommands#CR()
" buffers
nnoremap gbv :<c-u>ls t<CR>:vert sb<Space>
nnoremap gB :<c-u>ls t<CR>:bd<Space>

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

" Set color scheme after setting buffer colors
colorscheme xcodewwdc
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

" Make on save
autocmd GeneralSettings BufWritePost *.js,*.jsx,*.ts,*.tsx silent lmake! <afile> | silent redraw!

" Open qf list window
autocmd GeneralSettings QuickFixCmdPost cgetexpr cwindow
autocmd GeneralSettings QuickFixCmdPost l* lwindow

" Set prettier as formatter
autocmd GeneralSettings FileType
			\ javascript,typescript,less,css,html,typescriptreact setlocal
			\ formatprg=node_modules/.bin/prettier\ --stdin\ --stdin-filepath\ %
autocmd GeneralSettings FileType
			\ javascript,typescript,less,css,html,typescriptreact setlocal formatexpr=

" Run ctags if git exists
autocmd GeneralSettings BufWritePost * 
			\ if finddir('.git', '.;') == ".git" |
			\ execute 'Dispatch! ctags .' |
			\ endif
" }}}

" Commands {{{
" Grep for quickfix list
command! -nargs=+ -complete=file -bar Grep cgetexpr functions#grep(<q-args>)
" Grep for quickfix list
command! -nargs=0 -bar GrepWord execute 'Grep '.expand('<cword>')
" Last grep
command! -nargs=0 GrepLast execute 'Grep '.@/.' %'
" Grep buffer
command! -nargs=0 GrepBuffer execute 'Grep '.expand('<cword>').' %'

" Git stash list
command! -nargs=0 Gstash :call functions#getGitStash()

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
command! -nargs=0 MassMake call functions#massMake()

" }}}

" Abbr {{{
call functions#setupCommandAbbrs('w','update')
call functions#setupCommandAbbrs('nw','noautocmd update')
call functions#setupCommandAbbrs('ngw','noautocmd Gw')
call functions#setupCommandAbbrs('sov','source $MYVIMRC')
call functions#setupCommandAbbrs('gp','Dispatch! git push')
call functions#setupCommandAbbrs('gl','Dispatch! git pull')
call functions#setupCommandAbbrs('gs','Gstash')
call functions#setupCommandAbbrs('ssl','SessionLoad')
call functions#setupCommandAbbrs('ssa','SessionSave')
call functions#setupCommandAbbrs('gr','Grep')
call functions#setupCommandAbbrs('grl','GrepLast')
call functions#setupCommandAbbrs('grb','GrepBuffer')
call functions#setupCommandAbbrs('grw','GrepWord')
" }}}

" Plugins {{{
packloadall          " Load all plugins
packadd cfilter      " Filter results from qf lists

" Netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Rhubarb
let g:github_enterprise_urls = ['https://github.dev.global.tesco.org']

" Dispatch
set shellpipe=2>&1\|tee
" }}}
