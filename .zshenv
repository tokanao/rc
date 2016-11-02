
## 重複パスを登録しない
# typeset -U path cdpath fpath manpath

# if [ -e /usr/local/share/zsh-completions ]; then
#     fpath=(/usr/local/share/zsh-completions $fpath)
# fi
autoload -Uz compinit
compinit

# zargs -- **/*rb -- grep -i <keyword>
autoload zargs

# 補完でカラーを使用する
autoload -U colors; colors


path=(/usr/local/Cellar/postgresql-9.2/9.2.18/bin(N-/) $path)
