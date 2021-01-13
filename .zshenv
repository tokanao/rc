
## 重複パスを登録しない
typeset -U path cdpath fpath manpath

# if [ -e /usr/local/share/zsh-completions ]; then
#     fpath=(/usr/local/share/zsh-completions $fpath)
# fi
autoload -Uz compinit
compinit

# zargs -- **/*rb -- grep -i <keyword>
# find . -type f -name '*.mp3' -print0 | xargs -0 rm
# print -N ./**/*(.) | xargs -0 rm
autoload zargs

# iterm2 ref.https://qiita.com/nishina555/items/c3cdab6d059ee494c66e
autoload -U colors; colors


path=(/usr/local/Cellar/postgresql-9.2/9.2.18/bin(N-/) $path)
