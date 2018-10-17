" vim: ts=2 sts=2 sw=2 et

" Sava cache.
" Note: you can quickly purge the cache by pressing <F5> while inside CtrlP.
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0

" MRU History size
let g:ctrlp_mruf_max = 1000

" Enable migemo
let g:ctrlp_use_migemo = 1

" Show hidden files
let g:ctrlp_show_hidden = 1

" Ignore file and directories
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|vendor/bundle|\.venv|\.git|\.hg|\.serverless(|_plugins))$',
  \ 'file': '\v\.(exe|so|dll|jpg|gif|png|sw[a-z])$',
  \ }
