" スクリプトの一覧表示
" :scriptnames

"メッセージをレジスタ{a-z}にリダイレクトする
" :redi[r] @{a-zA-Z}
" :redir END

":helptags +=$VIM/bundle/emmet-vim/doc

" ヘルプコマンド関連
"help user-manual
"help howto
"help index
"viusage
"exusage

" big size file open
"vim -u NONE file_name

" javascript autoformat
" :Autoformat

" HTML tag delete
":%s/<.\{-}>//g

" Alignを日本語環境で使用するための設定
":let g:Align_xstrlen = 3

" ヘルプ全文検索
":helpgrep <keyword>

" 実行確認
"echo executable('rubocop')

" Ruby select inside method: v + i + m

" 標準出力を編集
" mdfind -onlyin ./ Schemafile | vi -
