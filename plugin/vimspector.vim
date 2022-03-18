" Default simple mapping
let g:vimspector_enable_mappings = 'HUMAN'

" commands
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

" Mappings
" for normal mode - the word under the cursor
nmap ,de <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap ,de <Plug>VimspectorBalloonEval

nmap ,db <Plug>VimspectorToggleBreakpoint
nmap ,do <Plug>VimspectorStepOver
nmap ,di <Plug>VimspectorStepInto
nmap ,dO <Plug>VimspectorStepOut

" Easy abbrs
call utils#setupCommandAbbrs('de','Debug')
call utils#setupCommandAbbrs('dr','DRestart')
call utils#setupCommandAbbrs('dR','DReset')
call utils#setupCommandAbbrs('dc','DContinue')
call utils#setupCommandAbbrs('dtb','DTBreakpoint')
call utils#setupCommandAbbrs('dcb','DTCBreakpoint')
call utils#setupCommandAbbrs('dsO','DStepOver')
call utils#setupCommandAbbrs('dso','DStepOut')
call utils#setupCommandAbbrs('dsi','DStepInto')
