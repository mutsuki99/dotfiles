" Shougo/neobundle.vim - GitHub
" https://github.com/Shougo/neobundle.vim
" Vim-users.jp - Hack #238: neobundle.vim で plugin をモダンに管理する
" http://vim-users.jp/2011/10/hack238/
set nocompatible               " Be iMproved

let s:is_windows = has('win32') || has('win64')

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
if !s:is_windows
  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'tools\\update-dll-mingw',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ }

endif

" " My Bundles here:
" "
" " Note: You don't set neobundle setting in .gvimrc!
" " Original repos on github
" NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'Lokaltog/vim-easymotion'
" NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" " vim-scripts repos
" NeoBundle 'L9'
" NeoBundle 'FuzzyFinder'
" NeoBundle 'rails.vim'
" " Non github repos
" NeoBundle 'git://git.wincent.com/command-t.git'
" " Non git repos
" NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
" NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

" ...

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'scrooloose/nerdcommenter.git'
" NeoBundle 'scrooloose/nerdtree'
NeoBundle 'rkitover/vimpager'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'sudo.vim'
NeoBundle 'nginx.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/Align.git'
NeoBundle 'gregsexton/gitv.git'
NeoBundle 'PProvost/vim-ps1'

" colorscheme
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'croaker/mustang-vim'
" NeoBundle 'jeffreyiacono/vim-colors-wombat'
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'vim-scripts/Lucius'
" NeoBundle 'vim-scripts/Zenburn'
" NeoBundle 'mrkn/mrkn256.vim'
" NeoBundle 'jpo/vim-railscasts-theme'
" NeoBundle 'therubymug/vim-pyte'
" NeoBundle 'tomasr/molokai'

" molokai を fork してカスタムしたものを使用中。
NeoBundle 'mutsuki99/molokai'

" カラースキーム一覧表示に Unite.vim を使う
" NeoBundle 'ujihisa/unite-colorscheme'
" 256 カラーテーブルを確認する。
" NeoBundle 'guns/xterm-color-table.vim'

" Mac + tmux 用に入れたが、別に他でも使えそう。
" if has('gui_macvim') && has('kaoriya')
"   NeoBundle 'kana/vim-fakeclip.git'
" endif
NeoBundle 'kana/vim-fakeclip.git'

" Powerline
" NeoBundle 'alpaca-tc/alpaca_powertabline'
" NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" 分割した設定ファイルをすべて読み込む
" 注意！ color など GUI に関わる部分は .gvimrc に書かないと読まれない。
runtime! user/*.vim


