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

" {{{ [x] CSS Language Server
if executable('css-languageserver')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'css-languageserver',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
				\ 'whitelist': ['css', 'less', 'sass'],
				\ })
endif
" }}}

" {{{ [x] HTML Language Server
if executable('html-languageserver')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'html-languageserver',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
				\ 'whitelist': ['html'],
				\ })
endif
" }}}

" {{{ [x] Vim Language Server
if executable('vim-language-server')
	augroup LspVim
		autocmd!
		autocmd User lsp_setup call lsp#register_server({
					\ 'name': 'vim-language-server',
					\ 'cmd': {server_info->['vim-language-server', '--stdio']},
					\ 'whitelist': ['vim'],
					\ 'initialization_options': {
					\   'vimruntime': $VIMRUNTIME,
					\   'runtimepath': &rtp,
					\ }})
	augroup END
endif
" }}}

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
