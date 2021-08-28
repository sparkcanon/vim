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
setglobal ttimeout ttimeoutlen=100                 " Define terminal key code timeout
set number                                         " Display number column
set noshowmode                                     " Do not show mode in cmd line

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
setglobal path=.,**5                               " Standard path

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
set statusline=%{%utils#statusline_expr()%}
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

" floaterm
nnoremap <silent> <space>tt <cmd>FloatermToggle<cr>
nnoremap <silent> <space>tn <cmd>FloatermNew<cr>
nnoremap <silent> <space>tk <cmd>FloatermKill<cr>
nnoremap <silent> <space>tp <cmd>FloatermNext<cr>
nnoremap <silent> <space>th <cmd>FloatermHide<cr>
tnoremap <silent> <space>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <space>tk <C-\><C-n>:FloatermKill<CR>
tnoremap <silent> <space>tn <C-\><C-n>:FloatermNew<CR>
tnoremap <silent> <space>tp <C-\><C-n>:FloatermNext<CR>
tnoremap <silent> <space>th <C-\><C-n>:FloatermHide<CR>

" Netrw has a bug that doesnt open url in browser
nnoremap gx :call utils#OpenURLUnderCursor()<CR>

set iminsert=1
for mode in ['n', 'x']
	execute mode . 'noremap  : ;'
	execute mode . 'noremap  ; :'
endfor

" Clear highlighting
nnoremap <silent> /// :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

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
nnoremap <BS> <C-^>
nnoremap gQ :call format#buffer()<CR>
nnoremap <space>b :CocList buffers<cr>

" Substitute
nnoremap <Bslash>s :%s;\%V

" Global
nnoremap <Bslash>g :g;;#<Left><Left>

" Lists
cnoremap <expr> <CR> listcommands#CR()

" Find
nnoremap <space>f :CocList files<cr>
" nnoremap <space>s :split <bar> Files<space>
" nnoremap <space>v :vsp <bar> Files<space>
" nnoremap <space>t :tabnew <bar> Files<space>

" Edit
nnoremap <space>ee :e <C-R>='%:h/'<CR>
nnoremap <space>ev :vsp <C-R>='%:h/'<CR>
nnoremap <space>es :sp <C-R>='%:h/'<CR>
" }}}

" Section: Colors {{{
" Modify buffer colors
autocmd GeneralAutocmds ColorScheme * call colors#modifyBufferColors()

" Tip: Fixes for colorschemes {{{
set termguicolors " For 24-bit colours
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
colorscheme habanight " Set color scheme after setting buffer colors
" }}}

" Section: Auto commands {{{
" Opens fugitive, man, help vertically if space available
autocmd! GeneralAutocmds WinNew * au BufEnter * ++once
			\ if (&bt ==? 'help' || &ft ==? 'man' || &ft ==? 'fugitive')
			\     && winwidth(winnr('#')) >= 180 |
			\ exe 'wincmd ' . (&splitright ? 'L' : 'H') |
			\ endif

" Opens terminal vertically if space available
" autocmd! GeneralAutocmds TerminalOpen * au TerminalWinOpen * ++once
" 			\ if winwidth(winnr('#')) >= 180 |
" 			\ exe 'wincmd ' . (&splitright ? 'L' : 'H') |
" 			\ endif

" Create a new dir if it doesnt exists
autocmd! GeneralAutocmds BufNewFile * call utils#mkdir(expand('<afile>:p:h'))

" Auto-resize splits when Vim gets resized.
autocmd! GeneralAutocmds VimResized * wincmd =

" Save session on exit
autocmd! GeneralAutocmds VimLeavePre * call sessions#sessionSave()

" Note: This causes problems on larger projects, perhaps move this to jobs api
" autocmd! GeneralAutocmds BufEnter,BufAdd * call path_job#setProjectPath()

" Auto backslash
autocmd GeneralAutocmds FileType vim packadd! vim-backslash

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

" Fuzzy pickers
command! -nargs=1 -complete=customlist,jest#picker Jest                call jest#runner(<q-args>)
command! -nargs=0 JestCurrent                                          call jest#runner(expand('%'))
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
call utils#setupCommandAbbrs('ff','Files')
call utils#setupCommandAbbrs('fv','vsplit \| Files')
call utils#setupCommandAbbrs('fs','split \| Files')
call utils#setupCommandAbbrs('ft','tabe \| Files')

" Buffer list
call utils#setupCommandAbbrs('lv','ls\<space>t\<CR>:vert sb \| Buffers')
call utils#setupCommandAbbrs('lt','ls\<space>t\<CR>:tab sb \| Buffers')
call utils#setupCommandAbbrs('br','bp\<bar>bd#')
call utils#setupCommandAbbrs('sb','sb \| Buffers')
call utils#setupCommandAbbrs('b','Buffers')

" Session
call utils#setupCommandAbbrs('sl','SessionLoad')
call utils#setupCommandAbbrs('sa','SessionSave')

" Grep
call utils#setupCommandAbbrs('sr','grep!')

" Git
call utils#setupCommandAbbrs('gf','FloatermNew git fetch --all')
call utils#setupCommandAbbrs('gp','FloatermNew git push')
call utils#setupCommandAbbrs('gl','Git pull')
call utils#setupCommandAbbrs('gd','Git difftool')
call utils#setupCommandAbbrs('gm','Git mergetool')
call utils#setupCommandAbbrs('gs','GitStash')
call utils#setupCommandAbbrs('gc','GitCheckout')
" }}}

" Section: Plugins && related setup {{{
" Load built-in optional plugins
packadd! cfilter  " Filter results from qf lists
packadd! matchit

" FZF
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

" Section: Syntax {{{
" Automatic, language-dependent indentation, syntax coloring and other
" functionality.
" Must come *after* the `:packadd!` calls above otherwise the contents of
" package "ftdetect" directories won't be evaluated.
filetype plugin indent on
syntax enable
" }}}
