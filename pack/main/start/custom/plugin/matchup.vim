let g:matchup_transmute_enabled = 1
let g:matchup_surround_enabled = 0 " Let vim-surround handle it
let g:matchup_matchparen_offscreen = {'method': 'popup'}

" Highlight surrounding match
nmap <silent> ,ms <plug>(matchup-hi-surround)
