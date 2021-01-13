# Created by newuser for 5.0.2
#

zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*:default' menu select=1
#  complete ignore character
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin


#export LANG=C.UTF-8    # locale -a
export LANG=ja_JP.UTF-8
export EDITOR=vim
export PAGER=less
# export PATH="$HOME/bin:$PATH"

# reset & emacs mode
bindkey -d
bindkey -e

# alias
alias -g L='|lv'
alias -g H='|head -n 20'
alias -g GN='grep -inr'
alias -g GL='grep -ilr'
alias -g V='|vi -'
alias -g P='|peco'
alias la='ls -a'
alias lsd='ls -l -d'
[ ! -e "/usr/bin/lv" ] && alias lv='less'
alias h='history 0'
alias vi='vim'
alias vizshrc='vi ~/.zshrc ~/.zprofile ~/.zshenv ; source ~/.zshrc'
alias vivimrc='vi ~/.vimrc'
alias visshconfig='vi ~/.ssh/config'
alias vinginx='vi /etc/nginx/conf.d'
alias viblog='vi /mnt/hgfs/railsprj/blog/source/blog/posts/'
#alias tree='tree --charset=x'
alias rc='rclone'
alias ff='find . -iname'
# alias beste='nice -n 19 ionice -c 3'
# alias gits='git status|head -n 20'
alias gits='git status -s'
alias gitf='git diff'
#alias lsd='ls -l --color=auto html|grep ^d'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias psg='ps aux|grep'
alias be='bundle exec'
alias rdebug='bundle exec rdebug-ide --host 127.0.0.1 --port 1234 --dispatcher-port 26162 -- bin/rails s'
alias ctags='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
alias fcd='cd "$(find . -type d | peco)"'
alias hgr='history 0|grep'
# alias hgr='echo $(history 0|peco)'
alias lsql='ls -lth *.sql'
alias check_release_stg="ssh stg 'cat /var/www/stg-manager.my-shop.fun/revisions.log|tail -n 3 && ls -l /var/www/stg-manager.my-shop.fun/revisions.log'"
alias check_release_prod="ssh prod 'cat /var/www/manager.my-shop.fun/revisions.log|tail -n 3 && ls -l /var/www/manager.my-shop.fun/revisions.log'"

alias tplcp='~/bin/tcp.rb'
alias tpldiff='~/bin/tpldiff.rb'
case ${OSTYPE} in
  darwin*)
    alias gvi='open /Applications/MacVim.app "$@"'
    alias ls='ls -G'
    alias ll='ls -lt -G'
    ;;
  linux*)
    alias ls='ls --color=auto'
    alias ll='ls -lt --color=auto --block-size=k'
    # CapsLockをCtrlに変更
    # setxkbmap -option ctrl:nocaps
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
# function cdup() {
#   echo
#   cd ..
#   #zle reset-prompt
#   zle accept-line
# }
# zle -N cdup
# bindkey '^j' cdup

# ^o is cd up
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

[ -d /usr/local/opt.coreutils/libexec/gnubi ] && export PATH="$PATH:/usr/local/opt.coreutils/libexec/gnubin"
# export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"


#### too heavy

if [ -d "$HOME/.rbenv/bin" ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# https://qiita.com/kawakami-kazuyoshi/items/bd148312815fb75818ee
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  # tmux対応
  # for D in `\ls $HOME/.anyenv/envs`
  # do
  #   export PATH="$HOME/.anyenv/envs/$D/bin:$PATH"
  # done
fi

[ -s ~/.nvm/nvm.sh ] && source ~/.nvm/nvm.sh
if [ -d /usr/local/opt/nvm ] ; then
  export NVM_DIR="$HOME/.nvm"
  source "/usr/local/opt/nvm/nvm.sh"
fi


# Required:
# curl -L git.io/nodebrew | perl - setup
if [ -d "$HOME/.nodebrew/current/bin" ] ; then
  export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi

[ -d ~/gibo ] && export PATH="$HOME/gibo:$PATH"


# dabbrev
# HARDCOPYFILE=$HOME/tmp/screen-hardcopy
# touch $HARDCOPYFILE
#
# dabbrev-complete () {
#         local reply lines=80 # 80行分
#         screen -X eval "hardcopy -h $HARDCOPYFILE"
#         reply=($(sed '/^$/d' $HARDCOPYFILE | sed '$ d' | tail -$lines))
#         compadd - "${reply[@]%[*/=@|]}"
# }
#
# zle -C dabbrev-complete menu-complete dabbrev-complete
# bindkey '^o' dabbrev-complete
# bindkey '^o^_' reverse-menu-complete

# Required: fzf
# git clone https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# [ -d ~/.zsh/zsh-autosuggestions ] && source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# function select-history() {
#   BUFFER=$(history -n -r 1 | awk '!a[$0]++' |fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
#   # CURSOR=$#BUFFER
#   zle accept-line
# }
# zle -N select-history
# bindkey '^r' select-history

function peco-history-selection() {
    # BUFFER=`history -n 1 | tac | awk '!a[$0]++' | peco`
    BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

#### mageee
[ -d ~/google-cloud-sdk ] && export PATH="/Users/tokashiki/google-cloud-sdk/bin:$PATH"
if [ -d /usr/local/opt/mysql@5.7 ] ; then
  export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
  export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig:$PKG_CONFIG_PATH"
fi
if [ -d /usr/local/opt/imagemagick@6 ] ; then
  # need to `brew install pkgconfig`
  export PATH="/usr/local/opt/imagemagick@6/bin:$PATH" 
  export PKG_CONFIG_PATH="/usr/local/opt/imagemagick@6/lib/pkgconfig:$PKG_CONFIG_PATH";
fi

if [ -e /usr/libexec/java_home ] ; then
  export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home'
  PATH=$PATH:$JAVA_HOME/bin
fi

if [ -d $HOME/Library/Android/sdk ] ; then
  export ANDROID_HOME='/Users/tokashiki/Library/Android/sdk'
  PATH=$PATH:$ANDROID_HOME/platform-tools
  PATH=$PATH:$ANDROID_HOME/tools/bin
  PATH="$PATH:$ANDROID_HOME/build-tools/28.0.2"
fi

if [ -f ~/.zsh/auto-fu.zsh/auto-fu.zsh ]; then
    source ~/.zsh/auto-fu.zsh/auto-fu.zsh
    function zle-line-init () {
        auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':completion:*' completer _oldlist _complete
fi

if [ -d /usr/local/Cellar/libpq/12.1/bin ] ; then
  export PATH="/usr/local/Cellar/libpq/12.1/bin:$PATH"
fi
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tokashiki/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tokashiki/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tokashiki/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tokashiki/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


export GNUMAKEFLAGS=-j8



#vim:ts=4:sw=4:et

