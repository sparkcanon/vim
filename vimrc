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
" Disable some vim plugins
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip            = 1
let g:loaded_logiPat         = 1
let g:loaded_rrhelper        = 1
let g:loaded_tarPlugin       = 1
let g:loaded_vimballPlugin   = 1
let g:loaded_zipPlugin       = 1
let g:loaded_netrwPlugin     = 1

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
Plug 'justinmk/vim-dirvish'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-dispatch'
Plug 'j5shi/CommandlineComplete.vim'
Plug 'bfrg/vim-qf-preview'
Plug 'editorconfig/editorconfig-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'markonm/traces.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'puremourning/vimspector'
Plug 'sheerun/vim-polyglot'
Plug 'github/copilot.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'mbbill/undotree'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
  \}

if executable('node')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'coc-extensions/coc-svelte', {'do': 'yarn install --frozen-lockfile'}
endif
call plug#end()
" }}}

" Section: Completion {{{
set completeopt+=menuone,popup
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

" Case
set smartcase
set ignorecase

" Wild menu options
set wildmode=lastused,full
set wildoptions+=fuzzy,pum
set wildignorecase
set wildignore+=*/node_modules/*,package-lock.json,yarn.lock

" Path options
" let &path = utils#SetPath()

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

" Cursor shape {{{
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
" }}}

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

" Disable Q
nnoremap Q <nop>

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

" Undo tree toggle
nnoremap ,u :UndotreeToggle<CR>

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

" Substitute
nnoremap ,s :%s;\(<C-r><C-w>\);<C-r><C-w>;gI<Left><Left><Left>
nnoremap g*n *Ncgn

" Global
nnoremap ,g :g//#<Left><Left>

" highlight and replace with dot
nnoremap ,* *``cgn
nnoremap ,# #``cgN

" Lists
cnoremap <expr> <CR> listcommands#CR()

" Edit
nnoremap <space>ee :e <C-R>='%:h/'<CR>
nnoremap <space>ev :vsp <C-R>='%:h/'<CR>
nnoremap <space>es :sp <C-R>='%:h/'<CR>

nnoremap <silent><nowait> <space>sf :CocList files<CR>
nnoremap <silent><nowait> <space><space> :CocList buffers<CR>
nnoremap <silent><nowait> <space>sg :CocList grep<CR>
nnoremap <silent><nowait> <space>? :CocList mru<CR>
nnoremap <silent><nowait> <space>/ :CocList words<CR>
nnoremap <silent><nowait> <space>sm :CocList marks<CR>
nnoremap <silent><nowait> <space>sr :CocListResume<CR>
nnoremap <silent><nowait> <space>sc :CocCommand<CR>
nnoremap <silent><nowait> <space>sk :CocList maps<CR>
nnoremap <silent><nowait> <space>sw :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>ss :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>sd  :<C-u>CocList diagnostics<cr>

nnoremap <silent><nowait> <space>jc :<C-u>CocList --input=jest. commands<CR>
nnoremap <silent><nowait> <space>gc :<C-u>CocList --input=git. commands<CR>
nnoremap <silent><nowait> <space>gs :<C-u>CocList --auto-preview gstatus<CR>

nnoremap <silent> <space>gg :Spawn lazygit<CR>

" copilot
imap <silent><script><expr> <c-g> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
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
colorscheme catppuccin_mocha
" }}}

" Section: Auto commands {{{
" Opens fugitive, man, help vertically if space available
autocmd! GeneralAutocmds WinNew * au BufEnter * ++once
      \ if (&bt ==? 'help' || &ft ==? 'man' || &ft ==? 'fugitive')
      \     && winwidth(winnr('#')) >= 180 |
      \ exe 'wincmd ' . (&splitright ? 'L' : 'H') |
      \ endif

autocmd! GeneralAutocmds BufWritePost $MYVIMRC source <afile>

autocmd! GeneralAutocmds TerminalOpen * setlocal nonumber nolist

" Opens terminal vertically if space available
" autocmd! GeneralAutocmds TerminalOpen * au TerminalWinOpen * ++once
" 			\ if winwidth(winnr('#')) >= 165 |
" 			\ exe 'wincmd ' . (&splitright ? 'L' : 'H') |
" 			\ endif

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

" This prevents weird artifacts from dispatch
autocmd! GeneralAutocmds FocusGained * silent redraw!
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
" }}}

" Section: Custom abbr {{{
" Write
call utils#setupCommandAbbrs('w','update')

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
call utils#setupCommandAbbrs('gr','gr!')

" Git
call utils#setupCommandAbbrs('gf','G fetch --all')
call utils#setupCommandAbbrs('gp','G push')
call utils#setupCommandAbbrs('gl','Git pull')
call utils#setupCommandAbbrs('gd','Git difftool')
call utils#setupCommandAbbrs('gm','Git mergetool')
" }}}

" Section: Plugins && related setup {{{
" Load built-in optional plugins
packadd! cfilter
packadd! matchit

" Svelte
let g:vim_svelte_plugin_use_typescript = 1

" Dirvish
let g:dirvish_mode = ':sort ,^\v(.*[\/])|\ze,'

" }}}
