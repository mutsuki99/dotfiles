"-- command --
" Reset tab width.
com -nargs=1 T :setlocal ts=<args> sts=<args> sw=<args>

" Vim-users.jp - Hack #78: CSVの特定のカラムをハイライトする
" http://vim-users.jp/2009/09/hack78/
function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csvhl :call CSVH(<args>)
