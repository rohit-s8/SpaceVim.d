set updatetime=300
set noswapfile
set tabstop=2
set shiftwidth=2
set expandtab
set autoread

augroup java_ft
  autocmd!
  autocmd Filetype java ALEDisable
  autocmd Filetype java nmap <silent> gd <Plug>(coc-definition)
  autocmd Filetype java nmap <silent> gt <Plug>(coc-type-definition)
  autocmd Filetype java nmap <silent> gi <Plug>(coc-implementation)
  autocmd Filetype java nnoremap <silent> <space>bf :call CocAction('format')<CR>
  autocmd Filetype java nnoremap <silent> K :call CocAction('doHover')<CR>
augroup END

nnoremap <silent> Q <esc>:<C-U>call SpaceVim#mapping#SmartClose()<CR>

if g:ale_enabled
  let g:ale_echo_delay=100
  let g:ale_linters.javascript = ['tsserver']
  let g:ale_fixers.javascript = ['eslint']
endif

let g:pydocstring_doq_path = "/usr/local/bin/doq"
let g:pydocstring_formatter = 'numpy'
let g:spacevim_todo_labels = ['FIXME', 'QUESTION', 'TODO', 'IDEA']

" Git Gutter sign colors
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" ALE sign colors
highlight ALEErrorSign guifg=#ff0000 guibg=#242526
