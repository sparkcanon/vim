" Default simple mapping
let g:vimspector_enable_mappings = 'HUMAN'

" Start debug mode
command! -nargs=? Debug call vimspector#Launch()
" Exit debug mode
command! -nargs=? DebugStop call vimspector#Reset()

nmap <S-F9> <Plug>VimspectorToggleConditionalBreakpoint
nmap <S-F8> <Plug>VimspectorRunToCursor
nmap <S-F5> <Plug>VimspectorLaunch
