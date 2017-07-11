" -- unite / no support. under vim 7.2
if v:version >= 704   " {{{
  " 入力モードで開始する
  " let g:unite_enable_start_insert=1

  " バッファ一覧 - vim 7.2 では利用できない
  noremap <C-e> :Unite bookmark<CR>

  " ファイル一覧
  " noremap <C-N> :Unite -buffer-name=file file<CR>

  " 最近使ったファイルの一覧
  " noremap <C-Z> :Unite file_mru<CR>
endif   " }}}
