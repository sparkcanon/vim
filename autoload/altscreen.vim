" Purpose: Do not send vim to background for make ops
" Source: https://github.com/fcpg/vim-altscreen/blob/master/plugin/altscreen.vim

function! altscreen#UnsetAltScreen() abort " {{{
  let g:altscreen_save_t_ti = &t_ti
  let g:altscreen_save_t_te = &t_te
  if get(g:, 'altscreen_reset', 1)
    let &t_ti = ""
    let &t_te = ""
  else
    let &t_ti = substitute(&t_ti, '\e\[?1049[hl]', '', '')
    let &t_te = substitute(&t_te, '\e\[?1049[hl]', '', '')
  endif
endfun
" }}}

function! altscreen#SetAltScreen() abort " {{{
  let &t_ti = g:altscreen_save_t_ti
  let &t_te = g:altscreen_save_t_te
endfun
" }}}

function! altscreen#AltScreenControlZ() abort " {{{
  try
    call altscreen#SetAltScreen()
    if exists('#AltScreen#User#suspend')
      doauto <nomodeline> AltScreen User suspend
    endif
    suspend!
  finally
    if exists('#AltScreen#User#resume')
      doauto <nomodeline> AltScreen User resume
    endif
    call altscreen#UnsetAltScreen()
  endtry
endfun
" }}}

" vim:foldmethod=marker
