" Purpose: set path
" Project: Tesco

function! setProjectPath#setProjectPath() abort
	" Desc: Set lego path
	if functions#isProject('lego-web')

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
	elseif functions#isProject('peas')
		let &l:path = '.,,'
					\ . 'packages/node/**,'
					\ . 'packages/web/**,'
	endif
endfunction