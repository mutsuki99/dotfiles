"-- command --
" Reset Indent width.
function! s:ResetIndentWidth(width)
    let &l:tabstop = a:width
    let &l:softtabstop = &l:tabstop
    let &l:shiftwidth = &l:tabstop
    IndentLinesReset
endfunction
com -nargs=1 T :call <SID>ResetIndentWidth(<f-args>)

" Vim-users.jp - Hack #78: CSVの特定のカラムをハイライトする
" http://vim-users.jp/2009/09/hack78/
function! CSVH(x)
    execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
    execute 'normal ^'.a:x.'f,'
endfunction
command! -nargs=1 Csvhl :call CSVH(<args>)
