" Default simple mapping
let g:vimspector_enable_mappings = 'HUMAN'

" Start debug mode
command! -nargs=? Debug call vimspector#Launch()
" Exit debug mode
command! -nargs=? DebugStop call vimspector#Reset()

augroup MyVimspectorUICustomistaion
	autocmd!
	autocmd User VimspectorUICreated set signcolumn=yes
	autocmd User VimspectorTerminalOpened set signcolumn=yes
augroup END
