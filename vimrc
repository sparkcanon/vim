" Settings {{{
" Basic
set backspace=indent,eol,start             " Normal backspace behaviour
set number                                 " Display number line
set hidden                                 " Display hidden buffers in list
set signcolumn=auto                        " Display sign column
set autoread                               " Update file if changed outside
set incsearch                              " Turn on incremental search
set hlsearch                               " Highlight search term
set showmatch                              " Highlight matching paranthesis
set cursorline
set wrap                                   " Wrap long lines
set autoindent                             " Minimal auto indenting for any filetype
set lazyredraw                             " Only redraw when I tell you to
set completeopt+=menuone,noinsert          " Open menu and no insert
set conceallevel=2                         " Conceal characters

" Splits
set splitbelow                             " Split window opens below
set splitright                             " Split window opens right
set switchbuf=vsplit                       " Vert split window for qf entries

" Case
set smartcase                              " To ignore case in certain cases, overrides ignorecase
set ignorecase                             " Ignore case all together

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
set statusline=\ ❮\ %<%f\
			\%h%m%r%=%-14.
			\(%l,%c%V%)\
			\%P\ ❯\ 

" Set wildmenu options
set wildmenu                               " Turn menu on for wild searches
set wildignorecase                         " Ignore case for wildmenu
set wildignore=*.swp,*.bak
set wildignore+=**/node_modules/**         " Ignore node_modules
set wildignore+=*.cache,*.min.*
set wildignore+=*/.git/**/*                " Ignore version control
set wildignore+=tags                       " Ignore tag files
set wildignore+=*.tar.*                    " Ignore tar files

" Path options
set path-=/usr/include                     " Exclude /usr/include dir
set path-=**/node_modules/**               " Exclude the blackhole
set path-=**/.git/**                       " Exclude the git
set path=.,**                              " Standard inclusion

" Grep
if executable('rg')
	set grepprg=rg\ --column\ --no-heading\ --smart-case\ --follow\ --vimgrep
	set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
" }}}

" Autocmd {{{
augroup GeneralSettings
	autocmd!
augroup END

" Auto close preview window
autocmd GeneralSettings CompleteDone * silent! pclose
autocmd GeneralSettings CursorMoved * silent! pclose

" Modify buffer colors
autocmd GeneralSettings ColorScheme * call functions#modifyBufferColors()

" Lsc colors
autocmd GeneralSettings ColorScheme * call functions#modifylscColors()

" Signify colors
autocmd GeneralSettings ColorScheme * call functions#modifySignifyColors()

" Create a new dir if it doesnt exists
autocmd GeneralSettings BufWritePre *
			\ if '<afile>' !~ '^scp:' && !isdirectory(expand('<afile>:h')) |
			\ call mkdir(expand('<afile>:h'), 'p') |
			\ endif

" Set cwd on bufenter
autocmd GeneralSettings BufEnter * silent! Glcd

" Auto-resize splits when Vim gets resized.
autocmd GeneralSettings VimResized * wincmd =

" Save session on exit
autocmd GeneralSettings VimLeavePre * call functions#sessionSave()

" Disable cursorline in insert mode
autocmd GeneralSettings InsertEnter * setlocal nocursorline
autocmd GeneralSettings VimEnter,InsertLeave * setlocal cursorline

" Leave marks to follow
autocmd GeneralSettings BufLeave *.css,*.less  normal! mC
autocmd GeneralSettings BufLeave *.html normal! mH
autocmd GeneralSettings BufLeave *.js,*.jsx normal! mJ
autocmd GeneralSettings BufLeave *.ts,*.tsx normal! mT

" Open qf list window
autocmd GeneralSettings QuickFixCmdPost cgetexpr cwindow
"}}}

" Syntax {{{
filetype plugin indent on
syntax on
" }}}

" Plugins {{{
packadd vim-polyglot    " A solid language pack for Vim
packadd vim-dirvish     " Directory viewer for Vim ⚡️
packadd vim-fugitive    " 💀 A Git wrapper so awesome, it should be illegal
packadd vim-eunuch      " Helpers for UNIX
packadd vim-dispatch    " Asynchronous build and test dispatcher
packadd vim-repeat      " repeat any command
packadd vim-surround    " quoting/parenthesizing made simple
packadd vim-commentary  " comment stuff out
packadd vim-unimpaired  " Pairs of handy bracket mappings
packadd vim-cool        " A very simple plugin that makes hlsearch more useful
packadd tabular         " 🌻 A Vim alignment plugin
packadd traces.vim      " Range, pattern and substitute preview for Vim
packadd vim-rhubarb     " GitHub extension for fugitive.vim

" Dirvish
let g:loaded_netrwPlugin = 1                     " disable netrw
let g:dirvish_mode = ':sort | sort ,^.*[^/]$, r' " Sort dir at the top

" Rhubarb
let g:github_enterprise_urls = ['https://github.dev.global.tesco.org']
" }}}

" Set this after vim polyglot has loaded {{{
" Set prettier as formatter
autocmd GeneralSettings FileType
			\ javascript,typescript,less,css,html,typescriptreact setlocal
			\ formatprg=prettier\ --stdin\ --stdin-filepath\ %
autocmd GeneralSettings FileType
			\ javascript,typescript,less,css,html,typescriptreact setlocal formatexpr=
" }}}

" Colorscheme {{{
packadd vim-colors-xcode    " Xcode 11’s dark and light colourschemes, now for Vim!
colorscheme xcodewwdc
" }}}

" Commands {{{
" Grep for quickfix list
command! -nargs=+ -complete=file -bar Grep cgetexpr functions#grep(<q-args>)
" Grep for quickfix list
command! -nargs=0 -bar GrepWord cgetexpr functions#grep(expand('<cword>'))
" Git stash list
command! -nargs=0 Gstash :call functions#getGitStash()
" Run jest test watcher
command! -nargs=1 -complete=file JestSingleFile call functions#jestRunForSingleFile()
" Save sessions (force)
command! -nargs=0 SessionSave call functions#sessionSave()
" Load sessions
command! -nargs=1 -complete=customlist,functions#sessionCompletePath
			\ SessionLoad call functions#sessionLoad(<q-args>)
" Show all diagnostics
command! -nargs=0 AllDiagnostics execute 'LSClientAllDiagnostics'
" Yank paths
" Relative path
command! -nargs=0 YRelative call functions#yankPath("relative")
" Full path
command! -nargs=0 YAbsolute call functions#yankPath("full")
" Filename
command! -nargs=0 Yfname call functions#yankPath("filename")
" Filename
command! -nargs=0 Ydirectory call functions#yankPath("directory")
" Console log
command! -nargs=0 Logger execute "normal oconsole.log('".expand('<cword>')." ====> ', ".expand('<cword>').")"
" }}}

" Abbr {{{
call functions#setupCommandAbbrs('w','update')
call functions#setupCommandAbbrs('sov','source $MYVIMRC')
call functions#setupCommandAbbrs('gr','Grep')
call functions#setupCommandAbbrs('gp','Dispatch! git push')
call functions#setupCommandAbbrs('gl','Dispatch! git pull')
call functions#setupCommandAbbrs('gs','Gstash')
call functions#setupCommandAbbrs('ssl','SessionLoad')
call functions#setupCommandAbbrs('ssa','SessionSave')
" }}}

" Mappings {{{
" Commands
nnoremap ; :
nnoremap : ;

" Clipboard
vnoremap <C-c> "*y
map <C-v> "*P

" Text object []
xnoremap ir i[
onoremap ir :normal vi[<CR>
xnoremap ar a[
onoremap ar :normal va[<CR>

" Omnifunc
" Completion pum
inoremap ,, <C-x><C-o>
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" keyword completion
inoremap        ,'      <C-n><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
" File name completion
inoremap        ,;      <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
" Whole line completion
inoremap        ,=      <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>

let mapleader = "\<space>"

" Clear highlights
nnoremap <leader>/ :nohlsearch<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <leader>tt :tab terminal<CR>

" Vim-qf
nmap <UP> <Plug>(qf_qf_toggle)
nmap <DOWN> <Plug>(qf_loc_toggle)

" Center search result line in screen
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # #zvzz

" Substitute
nnoremap <leader>sr :%s/<C-r><C-w>/
xnoremap <leader>sr <Esc>:%s/\V<C-R><C-R>=functions#getVisualSelection()<CR>/

" CFDO
nnoremap <leader>sc :cfdo %s/<C-r><C-w>//g \| update<S-Left><Left><Left><Left><Left><Left>
xnoremap <leader>sc :cfdo %s/\V<C-R><C-R>=functions#getVisualSelection()<CR>//gc \| update<S-Left><S-Left><Left><Left><Left><Left>

" Tabularize
xnoremap ga :Tabularize /
xnoremap g" :Tabularize / ".*<CR>
nnoremap ga :Tabularize /

" Format buffer
nnoremap gq gggqG

" Previous buffer
nnoremap <backspace> <C-^>

" Open last searched qf
nnoremap <silent> <leader>gr :execute 'Grep '.@/.' %'<CR>

" Find
nnoremap <leader>f :find <C-R>='./'<CR>
nnoremap <leader>c :Cfind <C-R>='./'<CR>
nnoremap <leader>s :sfind <C-R>='./'<CR>
nnoremap <leader>v :vert sfind <C-R>='./'<CR>
nnoremap <leader>t :tabfind <C-R>='./'<CR>

" Lists
" registers
nnoremap gr :<C-u>registers<CR>:normal! "p<Left>
" buffers
nnoremap gb :<c-u>ls t<CR>:b<Space>
nnoremap gB :<c-u>ls t<CR>:bd<Space>

" LSC
nnoremap ,v :vert LSClientGoToDefinitionSplit<CR>
" }}}

" Heavier plugins load last {{{
packadd vim-tmux-navigator  " Seamless navigation between tmux panes and vim splits
packadd vim-signify         " ➕ Show a diff using Vim its sign column
packadd vim-lsc             " A vim plugin for communicating with a language server
packadd vim-gutentags       " A Vim plugin that manages your tag files
packadd cfilter             " Filter results from qf/loc lists
" }}}
