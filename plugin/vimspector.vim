" Default simple mapping
let g:vimspector_enable_mappings = 'HUMAN'

command! -nargs=? Debug call vimspector#Launch()
command! -nargs=? DReset call vimspector#Reset()
command! -nargs=? DContinue call vimspector#Continue()
command! -nargs=? DStop call vimspector#Stop()
command! -nargs=? DRestart call vimspector#Restart()
command! -nargs=? DPause call vimspector#Pause()
command! -nargs=? DTBreakpoint call vimspector#ToggleBreakpoint()
command! -nargs=? DTCBreakpoint call vimspector#ToggleBreakpoint( { trigger expr, hit count expr } )
command! -nargs=? DTFBreakpoint call vimspector#AddFunctionBreakpoint( '<cexpr>' )
command! -nargs=? DRunCursor call vimspector#RunToCursor()
command! -nargs=? DStepOver call vimspector#StepOver()
command! -nargs=? DStepInto call vimspector#StepInto()
command! -nargs=? DStepOut call vimspector#StepOut()

" for normal mode - the word under the cursor
nmap <space>de <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <space>de <Plug>VimspectorBalloonEval

nmap <space>db <Plug>VimspectorToggleBreakpoint
nmap <space>do <Plug>VimspectorStepOver
nmap <space>di <Plug>VimspectorStepInto
nmap <space>dO <Plug>VimspectorStepOut
