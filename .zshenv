
## 重複パスを登録しない
# typeset -U path cdpath fpath manpath

# if [ -e /usr/local/share/zsh-completions ]; then
#     fpath=(/usr/local/share/zsh-completions $fpath)
# fi
autoload -Uz compinit
compinit

# zargs -- **/*rb grep -i <keyword>
autoload zargs
