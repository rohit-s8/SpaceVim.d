set updatetime=300
set noswapfile
set tabstop=2
set shiftwidth=2
set expandtab
set autoread

let g:pydocstring_doq_path = "/usr/local/bin/doq"
let g:pydocstring_formatter = 'numpy'
let g:spacevim_todo_labels = ['FIXME', 'QUESTION', 'TODO', 'IDEA']

" Git Gutter sign colors
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" ALE sign colors
highlight ALEErrorSign guifg=#ff0000 guibg=#242526

augroup java_ft
  autocmd!
  autocmd Filetype java ALEDisableBuffer
  autocmd Filetype java nnoremap <buffer><silent> <space>lga :call CocAction('codeAction', 0, 'Generate Getters and Setters...')<CR>
  autocmd Filetype java nnoremap <buffer><silent> <space>lgs :call CocAction('codeAction', 0, 'Generate toString()...')<CR>
  autocmd Filetype java nnoremap <buffer><silent> <space>lgc :call CocAction('codeAction', 0, 'Generate Constructors...')<CR>
  autocmd Filetype java nnoremap <buffer><silent> <space>lgi :call CocAction('codeAction', 0, 'Override/Implement Methods...')<CR>
augroup END

nmap <silent> <space>lsr <plug>(coc-rename)
nmap <silent> <space>lsR <plug>(coc-refactor)
nmap <silent> <space>ll <plug>(coc-codelens-action)
nmap <silent> <space>la <plug>(coc-codeaction)
nnoremap <silent> <space>lis :call CocAction('organizeImport')<CR>
call SpaceVim#mapping#space#def('nnoremap', ['b', 'f'], 'call CocAction("format")', 'format code', 1)

let g:_spacevim_mappings_g['d'] = ['<plug>(coc-definition)', 'Go to definition']
call SpaceVim#mapping#def('nmap <silent>', 'gd', '<plug>(coc-definition)', 'Go to definition')
let g:_spacevim_mappings_g['c'] = ['<plug>(coc-declaration)', 'Go to declaration']
call SpaceVim#mapping#def('nmap <silent>', 'gc', '<plug>(coc-declaration)', 'Go to declaration')
let g:_spacevim_mappings_g['i'] = ['<plug>(coc-implementation)', 'Go to implementation']
call SpaceVim#mapping#def('nmap <silent>', 'gi', '<plug>(coc-implementation)', 'Go to implementation')
let g:_spacevim_mappings_g['t'] = ['<plug>(coc-type-definition)', 'Go to type definition']
call SpaceVim#mapping#def('nmap <silent>', 'gt', '<plug>(coc-type-definition)', 'Go to type definition')
let g:_spacevim_mappings_g['r'] = ['<plug>(coc-references)', 'Go to references']
call SpaceVim#mapping#def('nmap <silent>', 'gr', '<plug>(coc-references)', 'Go to references')
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
nnoremap <silent> Q :call SpaceVim#mapping#SmartClose()<CR>

xmap if <plug>(coc-funcobj-i)
omap if <plug>(coc-funcobj-i)
xmap af <plug>(coc-funcobj-a)
omap af <plug>(coc-funcobj-a)
xmap ic <plug>(coc-classobj-i)
omap ic <plug>(coc-classobj-i)
xmap ac <plug>(coc-classobj-a)
omap ac <plug>(coc-classobj-a)

if g:ale_enabled
  let g:ale_echo_delay=100
  let g:ale_linters.javascript = ['tsserver']
  let g:ale_fixers.javascript = ['eslint']
endif
