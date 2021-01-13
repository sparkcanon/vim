" LSP Configuration

let g:lsp_settings_filetype_javascript = ['typescript-language-server', 'eslint-language-server']
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server']
let g:lsp_settings_filetype_typescriptreact = ['typescript-language-server', 'eslint-language-server']
let g:lsp_settings_filetype_javascriptreact = ['typescript-language-server', 'eslint-language-server']

let g:lsp_diagnostics_echo_cursor = 1

" {{{ [x] LSP Settings
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=no

	" allow modifying the completeopt variable, or it will
	" be overridden all the time
	let g:asyncomplete_auto_completeopt = 0
	set completeopt=menuone,noinsert,noselect,preview

	" Tags
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

	" Mappings
	nmap <buffer> ,j <plug>(lsp-definition)
	nnoremap <buffer> ,vj :vertical LspDefinition<CR>
	nnoremap <buffer> ,tj :tab LspDefinition<CR>
	nnoremap <buffer> ,sj :belowright LspDefinition<CR>
	nmap <buffer> ,r <plug>(lsp-references)
	nmap <buffer> ,i <plug>(lsp-implementation)
	nmap <buffer> ,d <plug>(lsp-type-definition)
	nmap <buffer> ,R <plug>(lsp-rename)
	nmap <buffer> [d <Plug>(lsp-previous-diagnostic)
	nmap <buffer> ]d <Plug>(lsp-next-diagnostic)
	nmap <buffer> K  <plug>(lsp-hover)
	nmap <buffer> ,p <plug>(lsp-peek-definition)
	nmap <buffer> ,a <plug>(lsp-code-action)
	nmap <buffer> ,e <plug>(lsp-document-diagnostics)

	" let g:lsp_format_sync_timeout = 1000
	" autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction
" }}}

" {{{ [x] Enable LSP
" call s:on_lsp_buffer_enabled only for languages that has the server registered.
augroup lsp_install
	au!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" }}}
