finish
" source: https://github.com/yegappan/lsp
let lspServers = [
		\     {
		\	'filetype': ['javascript', 'typescript', 'javascriptreact'],
		\	'path': '/Users/pratik/.local/share/nvim/lsp_servers/tsserver/node_modules/.bin/typescript-language-server',
		\	'args': ['--stdio']
		\     },
		\     {
		\	'filetype': ['javascript', 'typescript', 'javascriptreact'],
		\	'path': '/Users/pratik/.local/share/nvim/lsp_servers/vscode-eslint/node_modules/.bin/vscode-eslint-language-server',
		\	'args': ['--stdio']
		\     },
		\   ]

call lsp#addServer(lspServers)
