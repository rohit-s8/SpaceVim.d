" Git Gutter sign colors
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" ale configuration
if g:ale_enabled
  let g:ale_echo_delay=100
  let g:ale_linters.javascript = ['tsserver']
  let g:ale_fixers.javascript = ['eslint']
endif
" ALE sign colors
highlight ALEErrorSign guifg=#ff0000 guibg=#242526

" use coc for format buffer
call SpaceVim#mapping#space#def('nnoremap', ['b', 'f'], 'call CocAction("format")', 'format code', 1)

" coc bindings for gotos
let g:_spacevim_mappings_g['d'] = ['', 'Goto Definition']
nmap <silent> gd <plug>(coc-definition)
let g:_spacevim_mappings_g['c'] = ['', 'Goto Declaration']
nmap <silent> gc <plug>(coc-declaration)
let g:_spacevim_mappings_g['t'] = ['', 'Goto Type Definition']
nmap <silent> gt <plug>(coc-type-definition)
let g:_spacevim_mappings_g['i'] = ['', 'Goto Implementation']
nmap <silent> gi <plug>(coc-implementation)
let g:_spacevim_mappings_g['r'] = ['', 'Goto References']
nmap <silent> gr <plug>(coc-references)

" java filetype config
augroup java_ft
  autocmd!
  autocmd Filetype java ALEDisableBuffer
  " coc java code generator bindings
  autocmd FileType java call SpaceVim#custom#LangSPCGroupName('java', ['g'], '+Generate')
  autocmd FileType java call SpaceVim#custom#LangSPC('java', 'nnoremap', ['g', 'a'], 'call CocAction("codeAction", 0, "Generate Getters and Setters...")', 'Accessors', 1)
  autocmd FileType java call SpaceVim#custom#LangSPC('java', 'nnoremap', ['g', 's'], 'call CocAction("codeAction", 0, "Generate toString()...")', 'To String', 1)
  autocmd FileType java call SpaceVim#custom#LangSPC('java', 'nnoremap', ['g', 'c'], 'call CocAction("codeAction", 0, "Generate Constructors...")', 'Constructors', 1)
  autocmd FileType java call SpaceVim#custom#LangSPC('java', 'nnoremap', ['g', 'i'], 'call CocAction("codeAction", 0, "Override/Implement Methods...")', 'Override/Implement Methods', 1)
augroup END

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "java",
    "python",
    "c",
    "javascript",
    "lua",
    "go",
    "kotlin"
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages

  highlight = {
    enable = true, -- false will disable the whole extension
  },
}
EOF
