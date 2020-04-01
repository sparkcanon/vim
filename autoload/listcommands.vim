" Author: romainl
" Source: https://gist.github.com/romainl/5b2cfb2b81f02d44e1d90b74ef555e31
" Desc: make list-like commands more intuitive
function! listcommands#CR() abort
	let cmdline = getcmdline()
	command! -bar Z silent set more|delcommand Z
	if getcmdtype() != ':'
		return "\<CR>"
	endif
	if cmdline =~ '\v\C^(ls|files|buffers)'
		" like :ls but prompts for a buffer command
		return "\<CR>:b\<space>"
	elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
		" like :g//# but prompts for a command
		return "\<CR>:"
	elseif cmdline =~ '\v\C^(dli|il)\ '
		" like :dlist or :ilist but prompts for a count for :djump or :ijump
		return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
	elseif cmdline =~ '\v\C^(cli|lli)'
		" like :clist or :llist but prompts for an error/location number
		return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
	elseif cmdline =~ '\C^old'
		" like :oldfiles but prompts for an old file to edit
		set nomore
		return "\<CR>:Z|e #<"
	elseif cmdline =~ '\C^changes'
		" like :changes but prompts for a change to jump to
		set nomore
		return "\<CR>:Z|norm! g;\<S-Left>"
	elseif cmdline =~ '\C^ju'
		" like :jumps but prompts for a position to jump to
		set nomore
		return "\<CR>:Z|norm! \<C-o>\<S-Left>"
	elseif cmdline =~ '\C^marks'
		" like :marks but prompts for a mark to jump to
		return "\<CR>:norm! `"
	elseif cmdline =~ '\C^undol'
		" like :undolist but prompts for a change to undo
		return "\<CR>:u\<space>"
	elseif cmdline =~ '\C^reg'
		" like :register but prompts for a register to paste
		return "\<CR>:normal! \"p\<Left>"
	else
		return "\<C-]>\<CR>"
	endif
endfunction
