# Created by newuser for 5.0.2
#
autoload -U compinit
compinit

#補完でカラーを使用する
autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"


# alias
alias -g L='|less'
alias la='ls -a'
alias ll='ls -l --color=auto --block-size=k'
alias h='history 0'
alias vizshrc='vi ~/.zshrc ; source ~/.zshrc'
alias vivimrc='vi ~/.vimrc'
#alias tree='tree --charset=x'
alias rc='rclone'


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


#vim:ts=4:sw=4:et
