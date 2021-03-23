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

" Section: Load custom configuration {{{
packadd! custom
" }}}

" Section: Reset augroup {{{
augroup GeneralAutocmds
	autocmd!
augroup END
" }}}

" Section: Completion {{{
setglobal completeopt+=menuone,noinsert,popup         " Open menu and no insert
set omnifunc=syntaxcomplete#Complete                  " General purpose omnifunc
" }}}

" Section: Basic Settings {{{
setglobal backspace=indent,eol,start               " Normal backspace behaviour
setglobal hidden                                   " Display hidden buffers in list
setglobal autoread                                 " Update file if changed outside
setglobal incsearch                                " Turn on incremental search
setglobal hlsearch                                 " Highlight search term
setglobal showmatch                                " Highlight matching paranthesis
setglobal wrap                                     " Wrap long lines
setglobal autoindent                               " Minimal auto indenting for any filetype
setglobal clipboard^=unnamed                       " Set clipboard options
setglobal mouse=a                                  " Allow mouse interactions
set cursorline                                     " Makes it easy to find the cursor
setglobal ttimeout                                 " Terminal key code timeout
setglobal ttimeoutlen=100                          " Define terminal key code timeout
set number                                         " Display number column

" Splits
setglobal splitbelow                               " Split window opens below
setglobal splitright                               " Split window opens right

" Case
setglobal smartcase                                " To ignore case in certain cases, overrides ignorecase
setglobal ignorecase                               " Ignore case all together

" Wild menu options
setglobal wildmenu                                 " Turn menu on for wild searches
setglobal wildignorecase                           " Ignore case for wildmenu
setglobal wildignore=*.swp,*.bak                   " Ignore file patterns in wildmenu
setglobal wildignore+=*.cache,*.min.*,**/dist/**
setglobal wildignore+=**/.git/**/*
setglobal wildignore+=*-lock.json,*.snap

" Set fd error format
set errorformat+=%f                                " Efm for fd

" Path options
setglobal path=.,,**                               " Standard path

" Backup settings
setglobal sessionoptions-=options
setglobal viewoptions-=options
set undofile                                       " Set this option to have full undo power
setglobal backup                                   " Set this option to enable backup
setglobal writebackup                              " Set this option to write back up
setglobal backupdir=$HOME/.vim/tmp/dir_backup//    " Back up dir
setglobal directory^=$HOME/.vim/tmp/dir_swap//     " Swap file dir
setglobal undodir=$HOME/.vim/tmp/dir_undo          " Undo dir

" List chars
set list listchars=trail:·,eol:¬,tab:¦\ 

" Ruler
setglobal laststatus=2                             " Always show tausline
set statusline=%!utils#statusline_expr()
set ruler

" Show block cursor in Normal mode and line cursor in Insert mode
let &t_ti.="\e[2 q"
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"
let &t_te.="\e[0 q"

" Grepprg & grepformat
if executable('rg')
	setglobal grepprg=rg\ --vimgrep                  " Grep to use rg
	setglobal grepformat=%f:%l:%c:%m                 " rg errorform
endif
" }}}

" Section: Mappings {{{
" Enter commands mode completion
cmap <c-p> <Plug>CmdlineCompleteBackward
cmap <c-n> <Plug>CmdlineCompleteForward

" Netrw has a bug that doesnt open url in browser
nnoremap gx :call utils#OpenURLUnderCursor()<CR>

set iminsert=1
for mode in ['n', 'x']
	execute mode . 'noremap  : ;'
	execute mode . 'noremap  ; :'
endfor

" Clear highlighting
nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" Get more information from ctrl-g:
nnoremap <c-g> 2<c-g>

" Pane switching
if exists('$TMUX_PANE')
	nnoremap <silent> <a-h> :<c-u>call tmux#navigate('h')<cr>
	nnoremap <silent> <a-j> :<c-u>call tmux#navigate('j')<cr>
	nnoremap <silent> <a-k> :<c-u>call tmux#navigate('k')<cr>
	nnoremap <silent> <a-l> :<c-u>call tmux#navigate('l')<cr>
else
	nnoremap <a-l> <c-w>l
	nnoremap <a-h> <c-w>h
	nnoremap <a-j> <c-w>j
	nnoremap <a-k> <c-w>k
endif

" Jump to another window directly from terminal mode
tnoremap ¬ <c-w>l
tnoremap ˙ <c-w>h
tnoremap ∆ <c-w>j
tnoremap ˚ <c-w>k

" Allow using alt in macOS without enabling “Use Option as Meta key”
nmap ¬ <a-l>
nmap ˙ <a-h>
nmap ∆ <a-j>
nmap ˚ <a-k>

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
tnoremap <Esc> <C-\><C-n>
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
nnoremap <BS> <C-^>
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap gQ :call format#buffer()<CR>

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
nnoremap <space>f :Files<space>
nnoremap <space>s :split <bar> Files<space>
nnoremap <space>v :vsp <bar> Files<space>
nnoremap <space>t :tabnew <bar> Files<space>

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

" Tip: Fixes for colorschemes {{{
" set termguicolors " For 24-bit colours
" set t_Co=256 " For 256 colours
"
" Use the below when comments using some colourschemes look bad (look up what
" these mean)
" let &t_ZH="\e[3m"
" let &t_ZR="\e[23m"
"
" Use the below for some colourschemes (Look up what these mean)
" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
" }}}

set termguicolors
packadd! vim-gotham
set background=dark
colorscheme gotham256 " Set color scheme after setting buffer colors
" }}}

" Section: Auto commands {{{
" Preview window close
autocmd! GeneralAutocmds CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd! GeneralAutocmds CursorMoved * silent! pclose

" Opens fugitive, man, help vertically if space available
autocmd! GeneralAutocmds WinNew * au BufEnter * ++once
			\ if (&bt ==? 'help' || &ft ==? 'man' || &ft ==? 'fugitive')
			\     && winwidth(winnr('#')) >= 180 |
			\ exe 'wincmd ' . (&splitright ? 'L' : 'H') |
			\ endif

" Opens terminal vertically if space available
autocmd! GeneralAutocmds TerminalOpen * au TerminalWinOpen * ++once
			\ if winwidth(winnr('#')) >= 180 |
			\ exe 'wincmd ' . (&splitright ? 'L' : 'H') |
			\ endif

" Create a new dir if it doesnt exists
autocmd! GeneralAutocmds BufNewFile * call utils#mkdir(expand('<afile>:p:h'))

" Auto-resize splits when Vim gets resized.
autocmd! GeneralAutocmds VimResized * wincmd =

" Save session on exit
autocmd! GeneralAutocmds VimLeavePre * call sessions#sessionSave()

" Set path
autocmd! GeneralAutocmds BufEnter,BufAdd * call path_job#setProjectPath()

" Auto backslash
autocmd GeneralAutocmds FileType vim packadd! vim-backslash

" Fish
autocmd! GeneralAutocmds BufRead,BufNewFile *.fish packadd! vim-fish | setfiletype fish

" Js syntax
autocmd GeneralAutocmds FileType javascript,javascriptreact packadd! vim-javascript | packadd! vim-jsx-pretty

" Make autocmds
autocmd! GeneralAutocmds QuickFixCmdPre  lmake update
autocmd! GeneralAutocmds QuickFixCmdPost [^l]* cwindow
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

" Load tabular and align
command! -nargs=* -bang -range Tabularize packadd tabular <bar> Tabularize <args>

" Colors
command! -nargs=0 ColorsKitty call colors#Kitty()

" Fuzzy pickers
command! -nargs=1 -complete=customlist,jest#picker Jest                call jest#runner(<q-args>)
command! -nargs=1 -bar -complete=customlist,npm#complete Npm           call npm#runner(<q-args>)
command! -nargs=1 -bar -complete=customlist,files#picker Files         call files#runner(<q-args>)
command! -nargs=1 -bar -complete=customlist,buffers#picker Buffers     call buffers#runner(<q-args>, 'b')
command! -nargs=1 -bar -complete=customlist,buffers#picker VertBuffers call buffers#runner(<q-args>, 'vert sb')
command! -nargs=1 -bar -complete=customlist,buffers#picker TabBuffers  call buffers#runner(<q-args>, 'tab sb')
command! -nargs=1 -bar -complete=customlist,buffers#picker DBuffers    call buffers#runner(<q-args>, 'bd')
command! -nargs=1 -bar -complete=customlist,buffers#picker SplitBuffer call buffers#runner(<q-args>, 'sb')

" Git
command! -nargs=1 -complete=customlist,git#stash_picker GitStash       call git#stash_runner(<q-args>)
command! -nargs=1 -complete=customlist,git#checkout_picker GitCheckout call git#checkout_runner(<q-args>)
command! -nargs=? Diff call utils#Diff(<q-args>)
" }}}

" Section: Custom abbr {{{
" Write
call utils#setupCommandAbbrs('w','update')

" Buffer list
call utils#setupCommandAbbrs('lv','ls\<space>t\<CR>:VertBuffers')
call utils#setupCommandAbbrs('lt','ls\<space>t\<CR>:TabBuffers')
call utils#setupCommandAbbrs('ld','ls\<space>t\<CR>:DBuffers')
call utils#setupCommandAbbrs('br','bp\<bar>bd#')
call utils#setupCommandAbbrs('vb','VertBuffers')
call utils#setupCommandAbbrs('tb','TabBuffers')
call utils#setupCommandAbbrs('sb','SplitBuffer')
call utils#setupCommandAbbrs('b','Buffers')

" Session
call utils#setupCommandAbbrs('sl','SessionLoad')
call utils#setupCommandAbbrs('sa','SessionSave')

" Grep
call utils#setupCommandAbbrs('sr','grep!')

" Git
call utils#setupCommandAbbrs('gf','ter git fetch --all')
call utils#setupCommandAbbrs('gp','ter git push')
call utils#setupCommandAbbrs('gl','Git pull')
call utils#setupCommandAbbrs('gd','Git difftool')
call utils#setupCommandAbbrs('gm','Git mergetool')
call utils#setupCommandAbbrs('gs','GitStash')
call utils#setupCommandAbbrs('gc','GitCheckout')
" }}}

" Section: Plugins && related setup {{{
" Load built-in optional plugins
packadd! cfilter  " Filter results from qf lists
packadd! matchit  " Match matching symbols

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

" Section: Syntax {{{
" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
" Must come *after* the `:packadd!` calls above otherwise the contents of
" package "ftdetect" directories won't be evaluated.
filetype plugin indent on
syntax enable
" }}}
