#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#
bindkey -e

# 2007.11.8 shino add
# ログイン時 screen 対策
# bashrc profile を読み込む。
if [ "$TERM" = "screen" -a "x$SHLVL" = "x1" ]; then
    for i in /etc/profile.d/*.sh; do
        if [ -r "$i" ]; then
            . $i
        fi
    done
    unset i
fi

# PROMPT
autoload -U colors
colors
case ${UID} in
0)
    PROMPT="%B%{${fg[red]}%}[$USER@%M:%{${fg[cyan]}%}%~%{${fg[red]}%}]"$'\n'"#%{${reset_color}%}%b "

    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%R -> %r ? [n(o),y(es),a(bout),e(dit)]:%{${reset_color}%}%b "
    #[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    #   PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
*)
    PROMPT="%B%{${fg[white]}%}[$USER@%M:%{${fg[cyan]}%}%~%{${fg[white]}%}]"$'\n'"$%{${reset_color}%}%b "
    PROMPT2="%B%_$%b "
    SPROMPT="%B%R -> %r ? [n(o),y(es),a(bout),e(dit)]:%b "
    #[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    #   PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

# 2007.5.30 shino add
# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
screen)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
#    preexec() {
#        1="$1 "
#        _prelang=`echo $LANG | sed "s/.\+\.\(.\).\+/\1/"`
#        echo -ne "\ek${USER}:${${(s: :)1}[0]}($_prelang)\e\\"
#    }
    preexec() {
        # see [zsh-workers:13180]
        # http://www.zsh.org/mla/workers/2000/msg03993.html
        emulate -L zsh
        local -a cmd; cmd=(${(z)1})
        #local -a cmd; cmd=(${(z)2})
        _prelang=`echo $LANG | sed "s/.\+\.\(.\).\+/\1/"`
        echo -ne "\ek${USER}:$cmd[1]($_prelang)\e\\"
    }
    ;;
esac

autoload -U compinit
if [ "$OSTYPE" = "cygwin" ]; then
    compinit -u
else
    compinit
fi

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

setopt auto_cd pushd_ignore_dups hist_ignore_space
setopt auto_list auto_pushd extended_glob
setopt hist_expand pushd_to_home inc_append_history
setopt hist_ignore_all_dups hist_verify
setopt pushd_minus

zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000

setopt share_history
setopt correct
setopt list_packed
setopt multios
setopt noautoremoveslash
setopt complete_aliases
setopt completealiases

zstyle ':completion:*' list-colors ''

# 2008.5.19 履歴自動補完のオン・オフ追加
autoload -U predict-on
#predict-on
zle -N predict-off
zle -N predict-on
bindkey '^X^P' predict-on
bindkey '^Xp' predict-off

# 2008.5.19 履歴検索のショートカット追加
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end 
bindkey "^F" vi-forward-word
bindkey "^B" vi-backward-word
bindkey "^W" vi-backward-kill-word

#-------------------------------------------------------------------------------
# alias
#-------------------------------------------------------------------------------
alias ls='ls --color=auto -F'
alias la='ls -a'
alias lla='ls -al'
alias l.='ls -d .*'
alias ll.='ls -ld .*'
alias vi=vim
alias sd=sudo
alias sdh='sudo -H'
alias eu='iconv -f euc-jp -t utf-8'
alias neu='nkf -uEw8m0'
alias nes='nkf -uEsm0'
alias grep='grep -E --color=auto --exclude='\''*.svn*'\'' --exclude=tags'
alias rgrep='grep -nIr'
alias ctags_php='ctags -R --languages=php --langmap=PHP:.php --php-types=c+i+f+d --sort=foldcase'
alias ctags_py='ctags -R --languages=python --langmap=Python:.py --python-types=c+m+f --sort=foldcase'
alias ....='../..'
alias mkdir='mkdir -p'
if which sudoedit > /dev/null 2>&1; then
    alias se='sudoedit'
fi
if which svn > /dev/null 2>&1; then
    alias svs='svn st'
    alias svc='svn ci'
    alias svd='svn diff'
    alias svu='svn up'
    alias svr='svn revert'
    alias svi='svn info'
    alias sva='svn add'
fi
if which hg > /dev/null 2>&1 ; then
    alias hga='hg add'
    alias hgar='hg addremove'
    alias hgc='hg ci'
    alias hgd='hg diff'
    alias hggl='hg glog | l'
    alias hgl='hg log'
    alias hgpl='hg pull'
    alias hgps='hg push'
    alias hgqn='hg qnew'
    alias hgqpp='hg qpop'
    alias hgqps='hg qpush'
    alias hgqs='hg qseries -s'
    alias hgr='hg revert'
    alias hgs='hg st'
    if which sudo > /dev/null 2>&1; then
        alias shg='sd hg'
        OLDIFS=$IFS
        IFS=$'\n'
        for i in $(alias|grep '^hg'); do
            src=$(echo $i|cut -d '=' -f 1)
            dist=$(echo $i|cut -d '=' -f 2|tr -d "\'")
            alias s${src}="sd $dist"
        done
        IFS=$OLDIFS
    fi
fi
if which git > /dev/null 2>&1 ; then
    alias gipl='git pull'
    alias gips='git push'
    alias gis='git status'
    alias gic='git commit'
    alias gia='git add'
    alias gig='git graph'
fi
if which less.sh > /dev/null 2>&1; then
    alias l='less.sh'
else
    alias l=less
fi

#-------------------------------------------------------------------------------
# 補完設定追加
#-------------------------------------------------------------------------------
## compdef
compdef _sudo sd sdh
# 補完禁止コマンド指定
#compdef _nothing scp
#compdef -d scp svnadmin svn

#-------------------------------------------------------------------------------
# Environment variables
#-------------------------------------------------------------------------------
case ${UID} in
0)
    export PATH=~/local/bin:~/local/sbin:$PATH
    ;;
*)
    export PATH=~/local/bin:~/local/sbin:/usr/local/sbin:/usr/sbin:/sbin:$PATH
    ;;
esac
export EDITOR=vim
export LESS="-IM -x 4"
if which vimpager > /dev/null 2>&1; then
    export PAGER=vimpager
fi
export TIME_STYLE=long-iso

# tmux settings
if which tmux > /dev/null 2>&1; then
    alias tmux='tmux -2'
fi

# load local functions
if [ -r ~/.functions ]; then
    source ~/.functions
fi

# Over write settings
if [ -r ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# Load toast
if [ -d ~/.toast ]; then
    eval $( ~/.toast/armed/bin/toast env )
    export LD_LIBRARY_PATH=$LIBRARY_PATH:$LD_LIBRARY_PATH
fi
