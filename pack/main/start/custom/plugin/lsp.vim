" LSP Configuration

" {{{ [x] ESLint Language Server
if executable('eslint-language-server')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'eslint-language-server',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'eslint-language-server --stdio']},
				\ 'whitelist': ['javascript', 'javascript.jsx', 'typescript', 'typescript.jsx', 'typescriptreact', 'javascriptreact'],
				\ 'initialization_options': { 'diagnostic': 'true' },
				\ 'workspace_config': {
				\   'validate': 'probe',
				\   'packageManager': 'npm',
				\   'codeActionOnSave': {
				\     'enable': v:true,
				\     'mode': 'all',
				\   },
				\   'codeAction': {
				\     'disableRuleComment': {
				\       'enable': v:true,
				\       'location': 'separateLine',
				\     },
				\     'showDocumentation': {
				\       'enable': v:true,
				\     },
				\   },
				\   'format': v:false,
				\   'quiet': v:false,
				\   'onIgnoredFiles': 'off',
				\   'options': {},
				\   'run': 'onType',
				\   'nodePath': v:null,
				\ },
				\ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
				\ })
endif
" }}}

" {{{ [x] TypeScript Language Server
if executable('typescript-language-server')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'typescript-language-server',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
				\ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'package.json'))},
				\ 'whitelist': ['javascript', 'javascript.jsx', 'typescript', 'typescript.jsx', 'typescriptreact', 'javascriptreact'],
				\ })
endif
" }}}

" {{{ [x] LSP Settings
function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=no
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> ,j <plug>(lsp-definition)
	nmap <buffer> ,r <plug>(lsp-references)
	nmap <buffer> ,i <plug>(lsp-implementation)
	nmap <buffer> ,t <plug>(lsp-type-definition)
	nmap <buffer> ,R <plug>(lsp-rename)
	nmap <buffer> [d <Plug>(lsp-previous-diagnostic)
	nmap <buffer> ]d <Plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
	nmap <buffer> ,p <plug>(lsp-peek-definition)
	nmap <buffer> ,a <plug>(lsp-code-action)
	nmap <buffer> ,e <plug>(lsp-document-diagnostics)

	" let g:lsp_format_sync_timeout = 1000
	" autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

	" refer to doc to add more commands
endfunction
" }}}

" {{{ [x] Enable LSP
augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
" }}}
