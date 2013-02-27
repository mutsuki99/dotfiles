"-- map --
"map t gt
"map T gT
nmap <C-n> :tabe<Space>
"nmap <C-k> :tabe %:h<CR>
nmap <C-k> :NERDTreeToggle<CR>
" omni comp key map
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
nnoremap g/ :Migemo<CR>

" Don't use Ex mode, use Q for formatting
"map Q gq

