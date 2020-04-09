" Purpose: set path
" Project: Tesco

function! project_utils#setProjectPath() abort
	" Desc: Set lego path
	if project_utils#isProject('lego-web')

		let &l:path = '.,,'
					\ . 'web/,'
					\ . 'web/lib/**,'
					\ . 'web/components/**,'
					\ . 'web/selectors/**,'
					\ . 'web/experiments/**,'
					\ . 'web/config/**,'
					\ . 'web/actions/**,'
					\ . 'web/constants/**,'
					\ . 'web/analytics/**,'
					\ . 'web/gulp/**,'
					\ . 'web/reducers/**,'
					\ . 'web/routes/**,'
					\ . 'web/utils/**,'
					\ . 'web/views/**,'
					\ . 'web/middleware/**,'
					\ . 'web/resource-signatures/**,'
					\ . 'web/resourcePrep/**,'
					\ . 'web/tools/**,'
					\ . 'web/locales/**,'
					\ . 'web/specs/**,'
					\ . 'web/conditional-resources/**'

		" Desc: Set peas path
	elseif project_utils#isProject('peas')
		let &l:path = '.,,'
					\ . 'packages/node/**,'
					\ . 'packages/web/**,'
	endif
endfunction

" isProject {{{
" Desc: Check if the given project matches the directory we are in
" Params: match - { string } - match to
function! project_utils#isProject(match) abort
	if fnamemodify(getcwd(), ":p:h:t") == a:match
		return 1
	else
		return 0
	endif
endfunction
" }}}
