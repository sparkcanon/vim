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

" Mappings
nnoremap <silent> <space>dl :call vimspector#Launch()<CR>
nnoremap <silent> <space>dR :call vimspector#Reset()<CR>
nnoremap <silent> <space>dr :call vimspector#Restart()<CR>
nnoremap <silent> <space>dc :call vimspector#Continue()<CR>
nnoremap <silent> <space>ds :call vimspector#Stop()<CR>
nnoremap <silent> <space>dp :call vimspector#Pause()<CR>
nnoremap <silent> <space>db :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <space>dbc :call vimspector#ClearBreakpoints()<CR>
nnoremap <silent> <space>dso :call vimspector#StepOver()<CR>
nnoremap <silent> <space>dsi :call vimspector#StepInto()<CR>
nnoremap <silent> <space>dsO :call vimspector#StepOut()<CR>

let g:vimspector_sign_priority = {
  \    'vimspectorBP':         999,
  \ }
