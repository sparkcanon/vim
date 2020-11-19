" Purpose: Lsc configuration

" Section: Settings {{{
let g:lsc_enable_autocomplete = v:false  " Disable autocompletion
let g:lsc_trace_level = 'off'    " Turn off tracing for servers
let g:lsc_hover_popup = v:false  " Disable hover pop up
" }}}

" Section: Server configurations {{{
let g:lsc_server_commands = {
				\ 'javascript': {
					\ 'command': 'javascript-typescript-stdio',
					\ 'log_level': -1,
					\ 'supress_stderr': v:true,
				\ },
				\ 'jasmine.javascript': {
					\ 'command': 'javascript-typescript-stdio',
					\ 'log_level': -1,
					\ 'supress_stderr': v:true,
				\ },
				\ 'typescript': {
					\ 'command': 'javascript-typescript-stdio',
					\ 'log_level': -1,
					\ 'supress_stderr': v:true,
				\ },
				\ 'typescriptreact': {
					\ 'command': 'javascript-typescript-stdio',
					\ 'log_level': -1,
					\ 'supress_stderr': v:true,
				\ },
				\ 'html': 'html-languageserver --stdio',
				\ 'css': 'css-languageserver --stdio',
				\ 'less': 'css-languageserver --stdio',
				\ 'vim' : {
				\   'name': 'vim-language-server',
				\   'command': 'vim-language-server --stdio',
				\      'message_hooks': {
				\          'initialize': {
				\              'initializationOptions': { 'vimruntime': $VIMRUNTIME, 'runtimepath': &rtp },
				\          },
				\      },
				\  'supress_stderr': v:true,
				\   },
			\ }
" }}}

" Section: Remap default mappings {{{
let g:lsc_auto_map = {
			\ 'GoToDefinition'      : ',d',
			\ 'GoToDefinitionSplit' : ',D',
			\ 'FindReferences'      : ',r',
			\ 'NextReference'       : ',nr',
			\ 'PreviousReference'   : ',fr',
			\ 'FindImplementations' : ',i',
			\ 'FindCodeActions'     : ',a',
			\ 'Rename'              : ',R',
			\ 'ShowHover'           : v:true,
			\ 'DocumentSymbol'      : ',w',
			\ 'WorkspaceSymbol'     : ',W',
			\ 'SignatureHelp'       : ',s',
			\ 'Completion'          : 'omnifunc',
			\}
" }}}
