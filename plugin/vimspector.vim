" Default simple mapping
let g:vimspector_enable_mappings = 'HUMAN'

" commands
command! -nargs=? Debug call vimspector#Launch()
command! -nargs=? DebugReset call vimspector#Reset()
command! -nargs=? DebugContinue call vimspector#Continue()
command! -nargs=? DebugStop call vimspector#Stop()
command! -nargs=? DebugRestart call vimspector#Restart()
command! -nargs=? DebugPause call vimspector#Pause()

command! -nargs=? DebugBreakpointToggle call vimspector#ToggleBreakpoint()
command! -nargs=? DebugBreakpointToggleConditional call vimspector#ToggleBreakpoint( { trigger expr, hit count expr } )
command! -nargs=? DebugBreakpointFunction call vimspector#AddFunctionBreakpoint( '<cexpr>' )
command! -nargs=? DebugBreakpointClear call vimspector#ClearBreakpoints()
command! -nargs=? DebugRunToCursor call vimspector#RunToCursor()

command! -nargs=? DebugStepOver call vimspector#StepOver()
command! -nargs=? DebugStepInto call vimspector#StepInto()
command! -nargs=? DebugStepOut call vimspector#StepOut()

" Mappings
" for normal mode - the word under the cursor
nmap ,dE <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap ,dE <Plug>VimspectorBalloonEval
nmap ,db <Plug>VimspectorToggleBreakpoint

" Easy abbrs
call utils#setupCommandAbbrs('de','Debug')
call utils#setupCommandAbbrs('dr','DebugRestart')
call utils#setupCommandAbbrs('dR','DebugReset')
call utils#setupCommandAbbrs('dc','DebugContinue')
call utils#setupCommandAbbrs('dC','DebugRunToCursor')
call utils#setupCommandAbbrs('db','DebugBreakpointToggle')
call utils#setupCommandAbbrs('dB','DebugBreakpointClear')
call utils#setupCommandAbbrs('dbc','DebugBreakpointToggleConditional')
call utils#setupCommandAbbrs('dsO','DebugStepOver')
call utils#setupCommandAbbrs('dso','DebugStepOut')
call utils#setupCommandAbbrs('dsi','DebugStepInto')

let g:vimspector_sign_priority = {
  \    'vimspectorBP':         999,
  \ }
