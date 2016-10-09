# Created by newuser for 5.0.2
#
#autoload -U compinit
#compinit

# 補完でカラーを使用する
autoload -U colors; colors

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
case ${OSTYPE} in
    darwin*)
      ;;
    linux*)
      alias ls='ls --color=auto'
      ;;
esac
alias la='ls -a'
alias ll='ls -lt --color=auto --block-size=k'
[ ! -e "/usr/bin/lv" ] && alias lv='less'
alias h='history 0'
alias vi='vim'
alias vizshrc='vi ~/.zshrc ; source ~/.zshrc'
alias vivimrc='vi ~/.vimrc'
alias vinginx='vi /etc/nginx/conf.d'
alias viblog='vi /mnt/hgfs/railsprj/blog/source/blog/posts/'
#alias tree='tree --charset=x'
alias rc='rclone'
alias ff='find -iname'
# alias beste='nice -n 19 ionice -c 3'
alias gits='git status|head -n 20'
#alias lsd='ls -l --color=auto html|grep ^d'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias psg='ps aux|grep'
alias hgr='history 0|grep'
alias be='bundle exec'


PROMPT="${USER}@%m:%%"
RPROMPT='[%~]'

# 履歴の保存場所
HISTFILE=~/.zsh_history

# メモリ内の履歴の数
HISTSIZE=20000

# 保存される履歴の数
SAVEHIST=100000

# ディレクトリ最大数
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



# ^j で、cd ..
function cdup() {
  echo
  cd ..
  #zle reset-prompt
  zle accept-line
}
zle -N cdup
bindkey '^j' cdup

#bindkey -L 	show shortcut keys. written 'man zshzle'


# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end





#vim:ts=4:sw=4:et
