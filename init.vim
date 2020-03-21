set updatetime=300

if g:ale_enabled
  let g:ale_echo_delay=100
  let g:ale_linters.javascript = ['eslint']
  let g:ale_fixers.javascript = ['eslint']
endif

if g:spacevim_enable_neomake
  call neomake#configure#automake('nrwi', 500)
endif

augroup javascript_ft
  autocmd!
  autocmd Filetype javascript setlocal tabstop=2
  autocmd Filetype javascript setlocal shiftwidth=2
  autocmd Filetype javascript setlocal expandtab
augroup END

augroup html_ft
  autocmd!
  autocmd Filetype html setlocal tabstop=4
  autocmd Filetype html setlocal shiftwidth=4
  autocmd Filetype html setlocal expandtab
augroup END

unmap q
nnoremap <silent> Q <esc>:<C-U>call SpaceVim#mapping#SmartClose()<CR>
set autoread

let g:pydocstring_doq_path = "/usr/local/bin/doq"
