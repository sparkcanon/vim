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

" Section: Load plug {{{
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
			\| PlugInstall --sync | source $MYVIMRC
			\| endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-sleuth'
Plug 'wellle/targets.vim'
Plug 'j5shi/CommandlineComplete.vim'
Plug 'lambdalisue/vim-backslash', { 'for': 'vim' }
Plug 'puremourning/vimspector'
Plug 'bfrg/vim-qf-preview'
Plug 'editorconfig/editorconfig-vim'
Plug 'rhysd/conflict-marker.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'markonm/traces.vim'
Plug 'habamax/vim-habamax'
Plug 'mhinz/vim-signify'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'sheerun/vim-polyglot'

" may be?
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'yegappan/lsp'
call plug#end()
" }}}

" Section: Completion {{{
set completeopt+=menuone,noinsert,popup
set omnifunc=syntaxcomplete#Complete
" }}}

" Section: Basic Settings {{{
source $VIMRUNTIME/defaults.vim
set hidden
set autoread
set hlsearch
set showmatch
set wrap
set autoindent
set clipboard^=unnamed
set cursorline
set number
set signcolumn=yes

" Splits
set splitbelow
set splitright

" Case
set smartcase
set ignorecase

" Wild menu options
set wildmode=longest,full
set wildoptions=pum
set wildignorecase
set wildignore+=*/node_modules/*
set wildignore+=package-lock.json,yarn.lock

" Path options
let &path = utils#SetPath()

" Backup settings
set sessionoptions-=options
set viewoptions-=options
set undofile
set backup
set writebackup
set backupdir=$HOME/.vim/tmp/dir_backup//
set directory^=$HOME/.vim/tmp/dir_swap//
set undodir=$HOME/.vim/tmp/dir_undo

" List chars
set list listchars=trail:·,tab:¦\ ,eol:¬

" Ruler
set laststatus=1
set statusline=%{%utils#statusline_expr()%}

" Grepprg & grepformat
if executable('rg')
	set grepprg=rg\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Viminfo
if finddir('.git', '.;')
	call system('touch ' . $PWD . '/.viminfo')
endif
let &viminfofile=findfile('.viminfo','.;')
" }}}

" Section: Mappings {{{
" Enter commands mode completion
cmap <c-p> <Plug>CmdlineCompleteBackward
cmap <c-n> <Plug>CmdlineCompleteForward

" Netrw has a bug that doesnt open url in browser
nnoremap gx :call utils#OpenURLUnderCursor()<CR>

for mode in ['n', 'x']
	execute mode . 'noremap  : ;'
	execute mode . 'noremap  ; :'
endfor

" Clear highlighting
nnoremap <silent> <C-x> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Get more information from ctrl-g:
nnoremap <c-g> 2<c-g>

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
inoremap <C-f> <C-x><C-f>
" Line completion
inoremap <C-l> <C-x><C-l>
" Spell completion
inoremap <C-d> <C-x><C-s>
" Tab movement in pum
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" Terminal
tnoremap <Esc> <C-W>N
" NOTE: mapping esc twice lets you use arrow keys in terminal mode
tnoremap <Esc><Esc> <C-W>N
tnoremap <Bslash>t <c-w>:term<CR>

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
nnoremap ]b :bnext<CR>
nnoremap [b :bprev<CR>
nnoremap <BS> <C-^>
" nnoremap gQ :call format#buffer()<CR>

" Substitute
nnoremap <Bslash>s :%s;\%V

" Global
nnoremap <Bslash>g :g;;#<Left><Left>

" Lists
cnoremap <expr> <CR> listcommands#CR()

" Edit
nnoremap <space>ee :e <C-R>='%:h/'<CR>
nnoremap <space>ev :vsp <C-R>='%:h/'<CR>
nnoremap <space>es :sp <C-R>='%:h/'<CR>
" }}}

" Section: Colors {{{
" Modify buffer colors
autocmd GeneralAutocmds ColorScheme * call colors#modifyBufferColors()

" Tip: Fixes for colorschemes {{{
set termguicolors
" set t_Co=256 " For 256 colours

" Use the below when comments using some colourschemes look bad (look up what
" these mean)
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
"
" Use the below for some colourschemes (Look up what these mean)
" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
" }}}

set background=dark
colorscheme habamax
" }}}

" Section: Auto commands {{{
" Opens fugitive, man, help vertically if space available
autocmd! GeneralAutocmds WinNew * au BufEnter * ++once
			\ if (&bt ==? 'help' || &ft ==? 'man' || &ft ==? 'fugitive')
			\     && winwidth(winnr('#')) >= 180 |
			\ exe 'wincmd ' . (&splitright ? 'L' : 'H') |
			\ endif

" Opens terminal vertically if space available
autocmd! GeneralAutocmds TerminalOpen * au TerminalWinOpen * ++once
			\ if winwidth(winnr('#')) >= 165 |
			\ exe 'wincmd ' . (&splitright ? 'L' : 'H') |
			\ endif

" Create a new dir if it doesnt exists
autocmd! GeneralAutocmds BufNewFile * call utils#mkdir(expand('<afile>:p:h'))

" Auto-resize splits when Vim gets resized.
autocmd! GeneralAutocmds VimResized * wincmd =

" Save session on exit
autocmd! GeneralAutocmds VimLeavePre * call sessions#sessionSave()

" Make autocmds
autocmd! GeneralAutocmds QuickFixCmdPre  lmake update
autocmd! GeneralAutocmds QuickFixCmdPost [^l]* botright cwindow
autocmd! GeneralAutocmds QuickFixCmdPost l* lwindow
autocmd! GeneralAutocmds QuickFixCmdPost lmake call setloclist(
			\ bufnr(),
			\ filter(getloclist(bufnr()),
			\ "v:val['valid']"), 'r'
			\ )

" If swap exists, open read only mode
autocmd! GeneralAutocmds SwapExists * :let v:swapchoice = 'o'

" Wipe netrw buffers
autocmd GeneralAutocmds FileType netrw setlocal bufhidden=wipe
" }}}

" Section: Custom commands {{{
" Save sessions (force)
command! -nargs=0 SessionSave call sessions#sessionSave()
command! -nargs=1 -complete=customlist,sessions#complete SessionLoad execute 'source $HOME/.vim/tmp/dir_session/<args>'

" Yank paths
" Relative path
command! -nargs=? -complete=dir YRelative :let @+ = expand("%")
command! -nargs=? -complete=dir YFilename :let @+ = expand("%:t")

" Fuzzy pickers
" command! -nargs=1 -complete=customlist,jest#picker Jest                call jest#runner(<q-args>)
" command! -nargs=0 JestCurrent                                          call jest#runner(expand('%'))
command! -nargs=1 -complete=customlist,npm#complete Npm                call npm#runner(<q-args>)
command! -nargs=1 -complete=customlist,files#picker Files              call files#runner(<q-args>)
command! -nargs=1 -complete=customlist,buffers#picker Buffers          call buffers#runner(<q-args>)
command! -nargs=0 Fzf                                                  call files#fzf()
command! -nargs=+ Rg                                                   call files#rg(<q-args>)

" Git
command! -nargs=1 -complete=customlist,git#stash_picker GitStash       call git#stash_runner(<q-args>)
command! -nargs=1 -complete=customlist,git#checkout_picker GitCheckout call git#checkout_runner(<q-args>)
command! -nargs=? Diff call utils#Diff(<q-args>)
" }}}

" Section: Custom abbr {{{
" Write
call utils#setupCommandAbbrs('w','update')

" Files
call utils#setupCommandAbbrs('ff','find')
call utils#setupCommandAbbrs('fv','vert sfind')
call utils#setupCommandAbbrs('fs','sfind')
call utils#setupCommandAbbrs('ft','tabfind')

" Buffer list
call utils#setupCommandAbbrs('bv','ls\<space>t\<CR>:vert sb \| b')
call utils#setupCommandAbbrs('bt','ls\<space>t\<CR>:tab sb \| b')
call utils#setupCommandAbbrs('bD','ls\<space>t\<CR>:bd')
call utils#setupCommandAbbrs('bs','sb \| b')
call utils#setupCommandAbbrs('br','bp\<bar>bd#')

" Marks
call utils#setupCommandAbbrs('dm','marks\<CR>:delmarks')

" Session
call utils#setupCommandAbbrs('sl','SessionLoad')
call utils#setupCommandAbbrs('sa','SessionSave')

" Grep
call utils#setupCommandAbbrs('sr','grep!')

" Git
call utils#setupCommandAbbrs('gf','G fetch --all')
call utils#setupCommandAbbrs('gp','G push')
call utils#setupCommandAbbrs('gl','Git pull')
call utils#setupCommandAbbrs('gd','Git difftool')
call utils#setupCommandAbbrs('gm','Git mergetool')
call utils#setupCommandAbbrs('gs','GitStash')
call utils#setupCommandAbbrs('gc','GitCheckout')
" }}}

" Section: Plugins && related setup {{{
" Load built-in optional plugins
packadd! cfilter
packadd! matchit

" Gutentag files to tag
" let g:gutentags_file_list_command = 'fd -t f'

" fzf
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1 } }
set runtimepath+=/usr/local/opt/fzf
set rtp+=/opt/homebrew/opt/fzf

" Hexokinase
let g:Hexokinase_highlighters = ['backgroundfull']

" Disable vim plugins
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip            = 1
let g:loaded_logiPat         = 1
let g:loaded_rrhelper        = 1
let g:loaded_tarPlugin       = 1
let g:loaded_vimballPlugin   = 1
let g:loaded_zipPlugin       = 1
" }}}
