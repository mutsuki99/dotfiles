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
  if [ -e "$HOME/$i" ]; then
    echo "'$HOME/$i' already exists."
    continue
  fi
  ln -s "$PWD/$i" "$HOME/."
  [ $? -eq 0 ] && echo "create symbolic link '$i'."
done

# run NeoBundleInstall
git submodule init && git submodule update
neobundle_path="$HOME/.vim/bundle/neobundle.vim"
mkdir -p "$(dirname "$neobundle_path")"
which vim > /dev/null 2>&1 && vim +NeoBundleInstall +qa

# install vimpager and vimcat
mkdir -p ~/local/bin
[ -x ~/.vim/bundle/vimpager/vimpager -a ! -e ~/local/bin/vimpager ] && ln -s ~/.vim/bundle/vimpager/vimpager ~/local/bin/.
[ -x ~/.vim/bundle/vimpager/vimcat -a ! -e ~/local/bin/vimcat ] && ln -s ~/.vim/bundle/vimpager/vimcat ~/local/bin/.

# copy git config
[ -d gitconfig ] || { echo skip copy gitconfig; exit; }
pushd gitconfig
for i in $(/bin/ls -dA .*); do
  isGitConfigFiles "$i" || continue
  if [ -e "$HOME/$i" ]; then
    echo "'$HOME/$i' already exists."
    continue
  fi
  ln -s "$PWD/$i" "$HOME/."
  [ $? -eq 0 ] && echo "create symbolic link '$i'."
done
# .gitconfig.local だけはコピー。
[ -e "$HOME/.gitconfig.local" ] || cp -a "$PWD/.gitconfig.local.sample" "$HOME/.gitconfig.local"

popd

# copy hg config
[ -d hgconfig ] || { echo skip copy hgconfig; exit; }
pushd hgconfig
for i in $(/bin/ls -dA .*); do
  isMercurialConfigFiles "$i" || continue
  if [ -e "$HOME/$i" ]; then
    echo "'$HOME/$i' already exists."
    continue
  fi
  cp -a "$PWD/$i" "$HOME/."
  [ $? -eq 0 ] && echo "copy '$i'."
done
popd

# link zsh-completions
if [ ! -e ~/local/zsh/zsh-completions ]; then
  mkdir -p ~/local/zsh
  ln -s "$PWD/modules/zsh-completions" ~/local/zsh/.
  [ $? -eq 0 ] && echo "create symbolic link '~/local/zsh/zsh-completions'."
fi

# link git tools
if [ ! -e ~/local/bin/diff-highlight ]; then
  ln -s "$PWD/modules/git/contrib/diff-highlight/diff-highlight" ~/local/bin
  [ $? -eq 0 ] && echo "create symbolic link diff-highlight."
fi
if [ ! -e ~/local/zsh/functions/_git ]; then
  mkdir -p ~/local/zsh/functions
  ln -s "$PWD/modules/git/contrib/completion/git-completion.bash" ~/local/zsh/functions/.
  [ $? -eq 0 ] && echo "create symbolic link git-completion.bash."
  ln -s "$PWD/modules/git/contrib/completion/git-completion.zsh" ~/local/zsh/functions/_git
  [ $? -eq 0 ] && echo "create symbolic link git-completion.zsh to _git"
fi
if [ ! -e ~/local/bin/diff-highlight ]; then
  mkdir -p ~/local/bin
  ln -s "$PWD/modules/git/contrib/diff-highlight/diff-highlight" ~/local/bin/.
  [ $? -eq 0 ] && echo "create symbolic link diff-highlight."
fi
