
set ic

"行が折り返されている場合に対応
map j gj
map k gk
map n nzz

nmap <Space> 
nmap <C-l> :noh<CR>

" Move Window
nmap <C-p> <C-w>2-<CR>
nmap <C-n> <C-w>2+<CR>

map <F3> :cn<CR>
map <F4> :cp<CR>

" $this->p($var);
autocmd FileType php ab debug GC_Utils_Ex::gfDebugLog();<left><left>
autocmd FileType php ab debugp SC_Utils::sfPrintR();<left><left>

if has('win32')
" if has("gui_win32")

  scriptencoding utf-8

  " これないと map のキー指定が有効にならない！！
  set nocompatible

  let $DESKTOP=$HOME.'\Desktop'

  let $PATH = $PATH . ';C:\Program Files (x86)\Lynx for Win32'
  " let g:ref_phpmanual_cmd="C:/Program Files (x86)/Lynx for Win32/lynx.exe dump %s"
  " let g:ref_phpmanual_cmd="C:/Program Files (x86)/Lynx for Win32/lynx.exe -cfg=lynx.cfg"
  " let g:ref_phpmanual_cmd='lynx -dump %s -cfg="C:\\Program\ Files\ (x86)\\Lynx\ for\ Win32\\lynx.cfg"'
  let g:ref_phpmanual_cmd='lynx -dump %s -cfg="C:/Program Files (x86)/Lynx for Win32/lynx.cfg"'
  let g:ref_phpmanual_path='$VIM/doc/php-chunked-xhtml'

  set guioptions=gmrLtb
  set nobk
  set grepprg=findstr\ /n\ /is
  set clipboard+=unnamed " デフォルトレジスタ クリップボードレジスタ使用
  set noundofile
  set undodir=$VIM/undo
  set noequalalways      " 全てのウィンドウのサイズを同じにする。
  set scrolloff=5        " カーソルの上または下に表示する最小限の行数
  set ts=2
  set sw=2
  set et
                         " set verbose=9           " autocmdデバッグ用
  set path+=.\**

  " -- emmet
  " let g:user_emmet_settings = { 'variables': { 'lang' : 'ja' } } 
  let g:user_emmet_settings = { 'indentation' : '  ' }

  nmap <C-s> :w<CR>

  map j :!start gvim<CR>
  map m :set lines=50<CR>:set columns=120<CR>
  map l :set lines=60<CR>
  map h :set columns=160<CR>

  " VimTip 448: Yank (copy) decimal numbers from hex numbers.
  map \y g*<esc>:let @*=@/ + 0<enter> 

  " vimrc の更新、再読み込みを簡単にするマップ
  nmap ,s :source $VIM/vimrc_local.vim<CR>:source $VIM/vimrc<CR>
  " nmap ,v :tab args $VIM/vimrc_local.vim $VIM/vimrc<CR>
  nmap ,v :tabnew $VIM/vimrc_local.vim<CR>
  nmap ,r :pedit $VIM/vimrc_local_toka.vim<CR>

  nnoremap <F6> :let @* = '%'<CR>
  map <F8> :!start cmd<CR>
  map <F9> :call OpenExplorer()<CR>

  " Move Window
  nnoremap <C-f> :winpos =getwinposx() + 30<CR> =getwinposy()<CR><CR>
  nnoremap <C-b> :winpos =getwinposx() - 30<CR> =getwinposy()<CR><CR>

  " ググる
  nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>


  " ---- unite ----
  " 入力モードで開始する
  " let g:unite_enable_start_insert=1
  " バッファ一覧
  noremap <C-e> :Unite buffer<CR>
  " ファイル一覧
  " noremap <C-N> :Unite -buffer-name=file file<CR>
  " 最近使ったファイルの一覧
  " noremap <C-Z> :Unite file_mru<CR>

  "ab debuglog GC_Utils_Ex::gfDebugLog();<left><left>
  " $this->p($var);
  "ab debugprint SC_Utils::sfPrintR();<left><left>

  command! Memo       new    $VIM/mynote/memo.changelog
  command! -nargs=0 LcdCurrent lcd %:p:h

  function! OpenExplorer()
  if bufname("%") == ""
      execute "!start explorer ."
  else
      execute "!start explorer /select," . expand("%")
  endif
  endfunc 

  command! Tempfile call Tempfile()
  function! Tempfile()
    let tmpfile = tempname()
    execute "write! " . tmpfile
  endfunc

  "ChangeLog \c \o
  "let spec_chglog_format = "%c Naoya Tokashiki <ggtoka@gmail.com>"
  au BufNewFile,BufRead *.changelog setf changelog
  let g:changelog_timeformat = "%Y-%m-%d"
  let g:changelog_username = "Naoya Tokashiki <ggtoka@gmail.com>"

  autocmd FileType smarty set ts=4
  autocmd FileType smarty set sw=4


  " ---- NeoBundle ----
  if has('vim_starting')
    " Required:
    set runtimepath+=$VIM/bundle/*/
  endif

  " Required:
  call neobundle#begin(expand('$VIM/bundle/'))

  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundleFetch 'mattn/emmet-vim'
  NeoBundleFetch 'tyru/open-browser.vim'
  NeoBundleFetch 'Townk/vim-autoclose'
  NeoBundleFetch 'jphustman/Align.vim'
  NeoBundleFetch 'vim-scripts/surround.vim'
  NeoBundleFetch 'othree/html5.vim'
  NeoBundleFetch 'hail2u/vim-css3-syntax'
  NeoBundleFetch 'skammer/vim-css-color'
  NeoBundleFetch 'thinca/vim-ref'
  NeoBundleFetch 'vim-scripts/taglist.vim'
  NeoBundleFetch 'Shougo/unite.vim'
  NeoBundleFetch 'alvan/vim-closetag'
  NeoBundleFetch 'vim-scripts/Syntastic'
  NeoBundleFetch 'vim-scripts/Syntastic'

  " My Bundles here:
  " Refer to |:NeoBundle-examples|.
  " Note: You don't set neobundle setting in .gvimrc!

  call neobundle#end()

  " Required:
  filetype plugin indent on

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck
  " /---- NeoBundle ----



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
  "visuage
  "exusage


elseif has('unix')
  " PuTTY mouse setting
  set mouse=a
  set ttymouse=xterm2

  " PuTTY 右クリックペースト時、自動的にコメントアウトされるのを防ぐ
  set paste

  nmap ,s :source ~/.vimrc<CR>
  nmap ,v :tabnew ~/.vimrc<CR>

  " neobundle
  if has('vim_starting')
  if &compatible
   set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/*/
  endif

  " Required:
  call neobundle#begin(expand('~/.vim/bundle/'))

  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundleFetch 'mattn/emmet-vim'
  NeoBundleFetch 'tomtom/tcomment_vim'
  NeoBundleFetch 'vim-scripts/taglist.vim'

  " My Bundles here:
  " Refer to |:NeoBundle-examples|.
  " Note: You don't set neobundle setting in .gvimrc!

  call neobundle#end()

  " Required:
  filetype plugin indent on

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck

  colorscheme darkblue

elseif has('mac')
endif



" vim:ts=2:sw=2
