syntax on
set backspace=indent,eol,start
set tw=0
set ts=4 sw=4 et sts=4
set ai cindent smartindent
set ww=b,s,<,>,[,]
"set ww=b,s,h,l<,>,[,]
set virtualedit=block
set completeopt=menu,preview,longest
"set mouse=a
"if &term == "screen"
"	set ttymouse=xterm2
"endif

" クリップボードからのペースト時に自動インデント解除
" http://qiita.com/ahiruman5/items/4f3c845500c172a02935?utm_content=buffer59721&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer#-%E3%83%9A%E3%83%BC%E3%82%B9%E3%83%88%E8%A8%AD%E5%AE%9A
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
