#!/bin/bash
# vim: ts=2 sts=2 sw=2 et

# requires git
which git > /dev/null 2>&1 || { echo 'please install git.' 1>&2; exit 1; }

# functions
function isIgnoreFile () {
  case "$1" in
    .|..|.git|.gitmodules|.gitignore|.zshrc.simple|.*swp)
      return 0 ;;
    *)
      return 1 ;;
    esac
}

function isGitConfigFiles () {
  case "$1" in
    .gitconfig|.gitignore)
      return 0 ;;
    *)
      return 1 ;;
    esac
}

function isMercurialConfigFiles () {
  case "$1" in
    .hgrc|.hgignore)
      return 0 ;;
    *)
      return 1 ;;
    esac
}

# main
cd $(dirname "$0")

# link dotfiles
for i in $(/bin/ls -dA .*); do
  isIgnoreFile "$i" && continue
  echo "create symbolic link '$i'."
  if [ -e "$HOME/$i" ]; then
    echo "'$HOME/$i' already exists."
    continue
  fi
  ln -s "$PWD/$i" "$HOME/."
done

# run NeoBundleInstall
neobundle_path="$HOME/.vim/bundle/neobundle.vim"
if [ ! -e "$neobundle_path" ] ; then
  git clone https://github.com/Shougo/neobundle.vim.git "$neobundle_path"
  which vim > /dev/null 2>&1 && vim +NeoBundleInstall +qa
else
  echo "'$neobundle_path' already exists."
fi

# install vimpager and vimcat
mkdir -p ~/local/bin
[ -x ~/.vim/bundle/vimpager/vimpager -a ! -e ~/local/bin/vimpager ] && ln -s ~/.vim/bundle/vimpager/vimpager ~/local/bin/.
[ -x ~/.vim/bundle/vimpager/vimcat -a ! -e ~/local/bin/vimcat ] && ln -s ~/.vim/bundle/vimpager/vimcat ~/local/bin/.

# copy git config
[ -d gitconfig ] || { echo skip copy gitconfig; exit; }
cd gitconfig
for i in $(/bin/ls -dA .*); do
  isGitConfigFiles "$i" || continue
  echo "create symbolic link '$i'."
  if [ -e "$HOME/$i" ]; then
    echo "'$HOME/$i' already exists."
    continue
  fi
  ln -s "$PWD/$i" "$HOME/."

done
# .gitconfig.local だけはコピー。
[ -e "$HOME/.gitconfig.local" ] || cp -a "$PWD/.gitconfig.local.sample" "$HOME/.gitconfig.local"

cd ..

# copy hg config
[ -d hgconfig ] || { echo skip copy hgconfig; exit; }
cd hgconfig
for i in $(/bin/ls -dA .*); do
  isMercurialConfigFiles "$i" || continue
  echo "copy '$i'."
  if [ -e "$HOME/$i" ]; then
    echo "'$HOME/$i' already exists."
    continue
  fi
  cp -a "$PWD/$i" "$HOME/."
done
cd ..

