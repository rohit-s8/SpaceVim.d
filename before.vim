" basic configuration
set updatetime=300
set noswapfile
set autoread

" spacevim configuration
let g:spacevim_todo_labels = ['FIXME', 'QUESTION', 'TODO', 'IDEA']
let g:spacevim_search_tools = ['ag', 'rg', 'pt', 'ack', 'grep', 'findstr', 'git']

" delimitMate configuration
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" map spacevim's smart close to something different
nnoremap <silent> Q :call SpaceVim#mapping#SmartClose()<CR>

" coc refactor bindings
let s:coc_filetypes=['java', 'kotlin', 'python', 'go']
for ft in s:coc_filetypes
  call SpaceVim#custom#LangSPCGroupName(ft, ['r'], '+Code Refactor')
  call SpaceVim#custom#LangSPC(ft, 'nmap', ['r', 'n'], '<plug>(coc-rename)', 'Rename Symbol', 0)
  call SpaceVim#custom#LangSPC(ft, 'nmap', ['r', 'R'], '<plug>(coc-refactor)', 'Refactor', 0)
  call SpaceVim#custom#LangSPC(ft, 'nmap', ['r', 'i'], 'call CocActionAsync("organizeImport")', 'Sort imports', 1)
  call SpaceVim#custom#LangSPC(ft, 'nmap', ['r', 'f'], '<plug>(coc-format-selected)', 'Format Selected', 0)
  call SpaceVim#custom#LangSPC(ft, 'nmap', ['a'], '<plug>(coc-codeaction)', 'Show Available Actions', 0)
  call SpaceVim#custom#LangSPC(ft, 'nmap', ['f'], '<plug>(coc-fix-current)', 'Fix Current Issue', 0)
endfor

" show code documentation using coc
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" coc bindings for visual code select
xmap if <plug>(coc-funcobj-i)
omap if <plug>(coc-funcobj-i)
xmap af <plug>(coc-funcobj-a)
omap af <plug>(coc-funcobj-a)
xmap ic <plug>(coc-classobj-i)
omap ic <plug>(coc-classobj-i)
xmap ac <plug>(coc-classobj-a)
omap ac <plug>(coc-classobj-a)
