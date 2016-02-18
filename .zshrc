# Created by newuser for 5.0.2
#
autoload -U compinit
compinit

#補完でカラーを使用する
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

export LANG=ja_JP.UTF-8
export EDITOR=vim

# reset & emacs mode
bindkey -d
bindkey -e

# alias
alias -g L='|less'
alias -g H='|head -n 20'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -l --color=auto --block-size=k'
alias lv='less'
alias h='history 0'
alias vi='vim'
alias vizshrc='vi ~/.zshrc ; source ~/.zshrc'
alias vivimrc='vi ~/.vimrc'
alias vinginx='vi /etc/nginx/conf.d'
#alias tree='tree --charset=x'
alias rc='rclone'
alias ff='find -iname'
alias cdsf='cd /usr/share/nginx/html'
alias cdupt='cd /home/uptjp/www'
alias cdtool='/home/uptjp/www/tool'
# alias beste='nice -n 19 ionice -c 3'
alias gits='git status'
#alias lsd='ls -l --color=auto html|grep ^d'
alias mv='mv -i'


# 履歴の保存場所
HISTFILE=~/.zsh_history

# メモリ内の履歴の数
HISTSIZE=20000

# 保存される履歴の数
SAVEHIST=100000

# ディレクトリ最大数
DIRSTACKSIZE=100


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

# ビープ音を鳴らさない
setopt no_beep

# ^W - delete separate slash(/) 
WORDCHARS="`echo $WORDCHARS|sed 's!/!!'`"

#  complete ignore character
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


# ^で、cd ..
function cdup() {
echo
cd ..
#zle reset-prompt
zle accept-line
}
zle -N cdup
#bindkey '\^' cdup

#bindkey -L 	show shortcut keys. written 'man zshzle'


PROMPT="${USER}@%m:%%"
RPROMPT='[%~]'


# 履歴検索(^r)で スペースキーが無効化されてしまうため、使わない
# -- vim iab like expansion
# http://d.hatena.ne.jp/rubikitch/20071104/1194183191

# setopt extended_glob
#
# typeset -A abbreviations
# abbreviations=(
#   # "Im"    "| more"
#   # "Ia"    "| awk"
#   # "Ig"    "| grep"
#   # "Ieg"   "| egrep"
#   # "Iag"   "| agrep"
#   # "Igr"   "| groff -s -p -t -e -Tlatin1 -mandoc"
#   # "Ip"    "| $PAGER"
#   # "Ih"    "| head"
#   # "Ik"    "| keep"
#   # "It"    "| tail"
#   # "Is"    "| sort"
#   # "Iv"    "| ${VISUAL:-${EDITOR}}"
#   # "Iw"    "| wc"
#   # "Ix"    "| xargs"
#   "Be"  "nice -n 19 ionice -c 3"
# )
#
# magic-abbrev-expand() {
#     local MATCH
#     LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
#     LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
#     zle self-insert
# }
#
# no-magic-abbrev-expand() {
#   LBUFFER+=' '
# }
#
# zle -N magic-abbrev-expand
# zle -N no-magic-abbrev-expand
# bindkey " " magic-abbrev-expand
# bindkey "^x " no-magic-abbrev-expand



#vim:ts=4:sw=4:et
