# Created by newuser for 5.0.2
#

zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:default' menu select=1
#  complete ignore character
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin


export LANG=ja_JP.UTF-8
export EDITOR=vim
export PAGER=less

# reset & emacs mode
bindkey -d
bindkey -e

# alias
alias -g L='|lv'
alias -g H='|head -n 20'
alias la='ls -a'
[ ! -e "/usr/bin/lv" ] && alias lv='less'
alias h='history 0'
alias vi='vim'
alias vizshrc='vi ~/.zprofile ~/.zshenv ~/.zshrc ; source ~/.zshrc'
alias vivimrc='vi ~/.vimrc'
alias vinginx='vi /etc/nginx/conf.d'
alias viblog='vi /mnt/hgfs/railsprj/blog/source/blog/posts/'
#alias tree='tree --charset=x'
alias rc='rclone'
alias ff='find -iname'
# alias beste='nice -n 19 ionice -c 3'
# alias gits='git status|head -n 20'
alias gits='git status -s'
alias gitf='git diff'
#alias lsd='ls -l --color=auto html|grep ^d'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias psg='ps aux|grep'
alias hgr='history 0|grep'
alias be='bundle exec'
case ${OSTYPE} in
  darwin*)
    alias gvi='/Applications/MacVim.app/Contents/MacOS/MacVim "$@"'
    alias ls='ls -G'
    alias ll='ls -lt -G'
    ;;
  linux*)
    alias ls='ls --color=auto'
    alias ll='ls -lt --color=auto --block-size=k'
    # CapsLockをCtrlに変更
    setxkbmap -option ctrl:nocaps
    ;;
esac


PROMPT="${USER}@%m:%%"
# RPROMPT='[%~]'
RPROMPT='[%c]'
# RPROMPT="%{${fg[blue]}%}[%c]%{${reset_color}%}"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

PROMPT2="%{$fg[green]%}%_> %{$reset_color%}"
SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"


HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=100000
DIRSTACKSIZE=100

# ^W - delete separate slash(/) 
WORDCHARS="`echo $WORDCHARS|sed 's!/!!'`"


# ビープ音を鳴らさない
setopt no_beep

# 履歴ファイルに時刻を記録
setopt extended_history

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt append_history

# コマンドが入力されるとすぐに追加
setopt inc_append_history

# pushd時に同一ディレクトリを除去
setopt pushd_ignore_dups

# cdで自動的にpushd
setopt auto_pushd

# シェルのプロセスごとに履歴を共有
setopt share_history

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# ディレクトリ名だけでディレクトリの移動をする
setopt auto_cd

# 古い履歴を削除する必要がある場合、まず重複しているものから削除する
setopt hist_expire_dups_first

# historyコマンドは除去する 
setopt hist_no_store

# 重複するコマンドが保存される時、古い方を削除する 
setopt hist_save_no_dups 
# 履歴検索で重複しているものを表示しない 
setopt hist_find_no_dups

# 先頭空白の場合、履歴に残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# コマンド自動補正機能
setopt correct

# 補完候補を詰めて表示
setopt list_packed

# ^ ~ を使用して除外パターンを利用する
setopt extended_glob



# ^j で、cd ..
function cdup() {
  echo
  cd ..
  #zle reset-prompt
  zle accept-line
}
zle -N cdup
bindkey '^j' cdup
function cdold() {
  cd -
  zle accept-line
}
zle -N cdold
bindkey '^O' cdold

#bindkey -L 	show shortcut keys. written 'man zshzle'


# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


# chgrp, chown, ln, mkdir, mv, rm, rmdir, sync 
# zsh: argument list too long: mv
# getconf ARG_MAX
zmodload zsh/files




#vim:ts=4:sw=4:et
