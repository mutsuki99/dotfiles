#!/bin/bash
# vim: ts=2 sts=2 sw=2 et

# requires git
which git > /dev/null 2>&1 || { echo 'please install git.' 1>&2; exit 1; }

# functions
function isIgnoreFile () {
  case "$1" in
    .|..|.git|.gitmodules|.gitignore|.*swp)
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
git clone https://github.com/Shougo/neobundle.vim.git "$HOME/.vim/bundle/neobundle.vim"
which vim > /dev/null 2>&1 && vim +NeoBundleInstall +qa

# copy git config
[ -d gitconfig ] || { echo skip copy gitconfig; exit; }
cd gitconfig
for i in $(/bin/ls -dA .*); do
  isGitConfigFiles "$i" || continue
  echo "copy '$i'."
  if [ -e "$HOME/$i" ]; then
    echo "'$HOME/$i' already exists."
    continue
  fi
  cp -a "$PWD/$i" "$HOME/."
done

