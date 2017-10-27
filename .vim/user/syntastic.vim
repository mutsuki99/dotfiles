" vim: ts=2 sts=2 sw=2 et
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_highlighting = 1
" なんでか分からないけど php コマンドのオプションを上書かないと動かなかったらしい。
let g:syntastic_php_checkers = ['php']
let g:syntastic_php_php_args = '-l'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Java
let g:syntastic_java_javac_config_file_enabled = 1

" ruby
if executable('rubocop')
  " let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
  let g:syntastic_ruby_checkers = ['rubocop']
  let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of a variable in void context'}
endif

" Python
if executable('flake8')
  let g:syntastic_python_checkers = ['flake8']
elseif executable('pep8')
  if executable('pyflakes')
    let g:syntastic_python_checkers = ['pyflakes', 'pep8']
  else
    let g:syntastic_python_checkers = ['pep8']
  endif
elseif executable('pyflakes')
  let g:syntastic_python_checkers = ['pyflakes']
endif
