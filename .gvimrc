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
" ����ݒ�

set pfn=MeiryoKe_Gothic:h10:cSHIFTJIS
set popt=left:10mm,right:10mm,top:20mm,bottom:20mm,header:2
set popt+=syntax:a,number:y,wrap:y,collate:y,jobsplit:y,formfeed:y

"---------------------------------------------------------------------------
" ���{����͂Ɋւ���ݒ�:

if has('multi_byte_ime') || has('xim')
  " IME ON���̃J�[�\���̐F��ݒ�(�ݒ��:��)
  highlight CursorIM guibg=Purple guifg=NONE
  " �}�����[�h�E�������[�h�ł̃f�t�H���g��IME��Ԑݒ�
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIM�̓��͊J�n�L�[��ݒ�:
    " ���L�� s-space ��Shift+Space�̈Ӗ���kinput2+canna�p�ݒ�
    "set imactivatekey=s-space
  endif
  " �}�����[�h�ł�IME��Ԃ��L�������Ȃ��ꍇ�A���s�̃R�����g������
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

highlight ZenkakuSpace cterm=underline guifg=lightblue guibg=#333333
au BufNewFile,BufRead * match ZenkakuSpace /�@/

"---------------------------------------------------------------------------
" Clip Board

set guioptions+=a
set clipboard+=unnamed

