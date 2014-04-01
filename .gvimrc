"---------------------------------------------------------------------------
" Color

set background=dark
"let molokai_original = 1
colorscheme molokai

"---------------------------------------------------------------------------
" Font, Size

set guifont=Migu_2M:h10:cSHIFTJIS
set lines=58
set columns=150

"---------------------------------------------------------------------------
" File format

set fileformats=dos,unix,mac

"---------------------------------------------------------------------------
" 印刷設定

set pfn=MeiryoKe_Gothic:h10:cSHIFTJIS
set popt=left:10mm,right:10mm,top:20mm,bottom:20mm,header:2
set popt+=syntax:a,number:y,wrap:y,collate:y,jobsplit:y,formfeed:y

"---------------------------------------------------------------------------
" 日本語入力に関する設定:

if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

highlight ZenkakuSpace cterm=underline guifg=lightblue guibg=#333333
au BufNewFile,BufRead * match ZenkakuSpace /　/

"---------------------------------------------------------------------------
" Clip Board

set guioptions+=a
set clipboard+=unnamed

