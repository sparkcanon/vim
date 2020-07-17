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
setglobal statusline=\ ❮\ %<%{utils#ShortenFname()}
setglobal statusline+=\ %{utils#locListErrorCount()}
setglobal statusline+=\%h%m%r%=%-14.(%l,%c%V%)\%P\ ❯\ 

" Grepprg & grepformat
if executable('rg')
	setglobal grepprg=rg\ --vimgrep
	setglobal grepformat=%f:%l:%c:%m
endif
" }}}

" Section: Mappings {{{
" Enter Commands mode
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
nnoremap <Bslash>s :%s/\v<<C-r><C-w>>/
xnoremap <Bslash>s <Esc>:%s/<C-R><C-R>=utils#getVisualSelection()<CR>/

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
autocmd GeneralSettings ColorScheme * call color_utils#modifyBufferColors()

" Highlights git diff markers
autocmd GeneralSettings ColorScheme * match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set termguicolors " set 24bit colors

colorscheme xcodedarkhc " Set color scheme after setting buffer colors
" }}}

" Section: General auto commands {{{
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
autocmd GeneralSettings VimLeavePre * call sessions#sessionSave()

" Set path
autocmd GeneralSettings BufEnter * call project_utils#setProjectPath()

" Run ctags if git exists
autocmd GeneralSettings BufWritePost * 
			\ if finddir('.git', '.;') == ".git" |
			\ silent call system('ctags .') |
			\ endif

" Set up formatprg, formatexpr
autocmd GeneralSettings FileType typescript,typescriptreact call
			\ format_utils#setFormatPrg()
" }}}

" Section: Custom commands {{{
" Grep for quickfix list
command! -nargs=+ -complete=file Grep cgetexpr utils#grep(<q-args>)
" Grep word under the cursor
command! -nargs=0 -bar GrCword execute 'Grep ' . expand('<cword>')
" Manual grep for current buffer
command! -nargs=1 -bar GrWord execute 'Grep ' . <q-args> . ' %'
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

" Lint
" Lint all open buffers
command! -nargs=0 MassMake call make_utils#massMake()
" Lint current buffer
command! -nargs=* -complete=file -bar Make call
			\ make_utils#getexpr_efm("lgetexpr", make_utils#runMake(<f-args>))
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
call utils#setupCommandAbbrs('gr','Grep')
call utils#setupCommandAbbrs('grw','GrWord' )
call utils#setupCommandAbbrs('grc','GrCword')

" Git
call utils#setupCommandAbbrs('gp','Git push')
call utils#setupCommandAbbrs('gl','Git pull')
" }}}

" Section: Plugins && related setup {{{
packloadall!      " Load all plugins
packadd! cfilter  " Filter results from qf lists
packadd! matchit  " Jump to brackets

" Netrw
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_hide = 0
" }}}

" vim:foldmethod=marker
