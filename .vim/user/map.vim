"-- map --
" <Leader>
let mapleader = ","

" Tab Operation
"map t gt
"map T gT
nmap <C-n> :tabe<Space>
nmap <C-k> :tabe %:h<CR>
"nmap <C-k> :NERDTreeToggle<CR>

" omni comp key map
inoremap <expr> <C-J>      pumvisible()?"\<PageDown>\<C-N>\<C-P>":"\<C-X><C-O>"
inoremap <expr> <C-K>      pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<C-K>"
inoremap <Nul> <C-n>

" Enable migemo (TODO: Linux は Migemo 検知いるね。)
if ! (has('gui_macvim') && has('kaoriya'))
  nnoremap g/ :Migemo<CR>
endif

" Don't use Ex mode, use Q for formatting
"map Q gq

