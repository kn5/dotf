let g:ale_statusline_format = ['⨉ %d', '⚠ %d', 'OK']
let g:ale_python_flake8_executable = g:python3_neovim_bin_dir . '/flake8'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\   'python': ['flake8'],
\}
