
set ic
set ts=2
set sw=2
set et
set nowrapscan
set noequalalways

" set path+=\*\*/\*
set path=$PWD/**

"行が折り返されている場合に対応
map j gj
map k gk
map n nzz

nmap <Space> 
nmap <C-l> :noh<CR>

" Move Window
nmap <C-p> <C-w>2-<CR>
nmap <C-n> <C-w>2+<CR>

"map <F2> :echo expand("%:p")<CR>
map <F2> :let @" = expand("%:p")<CR>
map <F3> :cn<CR>
map <F4> :cp<CR>
map <F7> :set wrap!<CR>

"ab debuglog GC_Utils_Ex::gfPrintLog();<left><left>
ab eclog GC_Utils_Ex::gfDebugLog("---- TRACE ----");
ab ecprint SC_Utils::sfPrintR();
ab var_dump echo "<pre style='text-align:left;'>";<CR>var_dump($_SESSION);<CR>echo "</pre>";
ab tracelog $this->log("---- TRACE LOG ----".__LINE__);
ab debugcon <!--{debug}-->
ab printlog $this->p();<LEFT><LEFT>
ab YDATE =strftime("%Y/%m/%d")<CR>
ab dumptemplatevar <pre><!--{php}-->print_r(get_template_vars());<!--{/php}--></pre>

" print_r
" debug_print_backtrace();
" <!-- {$smarty.session} -->
" <!-- {$smarty.server|@debug_print_var} -->
" <!-- {$smarty.debugging} -->

"autocmd FileType php set et
"autocmd FileType html set et
"autocmd FileType smarty set et


" PHP perfomance
"$time_start = microtime(true);
"printf("Process Time : %.2f [s]\n", microtime(true) - $time_start);

"nmap ,e :NERDTreeToggle<CR>
"noremap <C-e> :Unite buffer<CR>  " vim 7.2 では利用できない
nmap ,e :Sexplore<CR>


command! Backup call Backup()
function! Backup()
  let sfile = expand("%:p")
  execute "write " . sfile . "~"
endfunc


" ---- ECCUBE CUSTOM ----
command! EcTemplate call EccubeTemplate()
command! EcCarrier call EccubeChangeCarrier()
" 引数が与えられるとレジスタのファイルパスをコピーする
command! -nargs=? EcInheritance call EccubeToggleInheritance(<args>)

function! EccubeTemplate()
  "let sfile = expand("%:p")
  let sfile = expand("%:f")
  let s1 = fnamemodify(sfile, ":h")
  let s2 = fnamemodify(sfile, ":h:h")
  let last_path = substitute(s1, s2, "", "")

  let tpl_path = 'data/Smarty/templates'
  let def_tpl = '/default2'

  let efile = substitute(sfile, "_extends", "", "g")

  if match(efile, "admin") == -1
    let path = tpl_path . def_tpl
  else
    let path = tpl_path . '/admin'
  endif
  let path = path . last_path

  echo path
  execute "new " . path

endfunction

function! EccubeChangeCarrier()
  let sfile = expand("%:f")
  if match(sfile, "default2") != -1
    let sfile = substitute(sfile, "default2", "sphone2", "")
  else
    let sfile = substitute(sfile, "sphone2", "default2", "")
  endif
  let @" = sfile
  execute "new ".sfile
endfunc

function! EccubeToggleInheritance(...)
  " 擬似デフォルト引数
  "let default_arg = a:0 >= 1 ? a:1 : "Hello!!"

  "let fpath = expand("%:p")
  let fpath = expand("%:f")
  if match(fpath, "class_extends") == -1
    let fpath = substitute(fpath, "class", "class_extends", "")
    let fpath = substitute(fpath, "pages",  "page_extends",  "")
    let ext = expand("%:e")
    let fpath = substitute(fpath, ".".ext, "_Ex.php", "")

  else
    let fpath = substitute(fpath, "page", "pages", "")
    let fpath = substitute(fpath, "_extends", "", "g")
    let fpath = substitute(fpath, "_Ex.php", ".php", "")
  endif

  let @" = fpath
  if a:0 < 1
    " no args
    execute "new " . fpath
  endif
endfunction
" ---- ECCUBE CUSTOM ----


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
                         " set verbose=9           " autocmdデバッグ用
  " set path+=.\**

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
  "mkdir ~/.vim/bundle
  "git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
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
  set grepprg=grep\ -inr\ $*\ /dev/null

  " PuTTY 右クリックペースト時、自動的にコメントアウトされるのを防ぐ
  "set paste

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


  nmap ,v :tabnew ~/.vimrc<CR>

  " Required:
  " % git clone https://github.com/koron/cmigemo
  " % cd cmigemo
  " % ./configure
  " % make gcc
  " % make gcc-dict
  " % make gcc-install
  noremap  g/ :<C-u>Migemo<CR>


  " Required:
  call neobundle#begin(expand('~/.vim/bundle/'))

  " Let NeoBundle manage NeoBundle
  " Required:
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundleFetch 'mattn/emmet-vim'
  NeoBundleFetch 'tomtom/tcomment_vim'
  NeoBundleFetch 'vim-scripts/taglist.vim'
  NeoBundleFetch 'tpope/vim-rails'      " Rails向けのコマンドを提供する
  NeoBundleFetch 'haya14busa/vim-migemo'
  if v:version >= 704
    NeoBundleFetch 'scrooloose/nerdtree'
    NeoBundleFetch 'Shougo/unite.vim'
  endif
  NeoBundleFetch 'chrisbra/SudoEdit.vim'
  NeoBundleFetch 'tpope/vim-fugitive'       " git
  NeoBundleFetch 'evanmiller/nginx-vim-syntax'

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

  " Stamp factory ソース切り替え(本番 <-> テスト環境)
  command! Toggle call Toggle()
  function! Toggle()
    let fpath = expand("%:p")

    if match(fpath, "/html/") != -1
      let fpath = substitute(fpath, "html", "html_test", "")
    elseif match(fpath, "/html_test/") != -1
      let fpath = substitute(fpath, "html_test", "html_test", "")

    elseif match(fpath, "/uptjp/") != -1
      let fpath = substitute(fpath, "uptjp", "uptjpdevel", "")
    elseif match(fpath, "/uptjpdevel/") != -1
      let fpath = substitute(fpath, "uptjpdevel", "uptjp", "")
    endif

    " echo fpath
    let @@ = fpath
    execute "new " . fpath
  endfunc

  command! DSplit call DSplit()
  function! DSplit()
    let fpath = expand("%:p")

    if match(fpath, "/html/") != -1
      let fpath = substitute(fpath, "html", "html_test", "")
    elseif match(fpath, "/html_test/") != -1
      let fpath = substitute(fpath, "html_test", "html_test", "")

    elseif match(fpath, "/uptjp/") != -1
      let fpath = substitute(fpath, "uptjp", "uptjpdevel", "")
    elseif match(fpath, "/uptjpdevel/") != -1
      let fpath = substitute(fpath, "uptjpdevel", "uptjp", "")
    endif

    execute "diffsplit " . fpath
  endfunc

elseif has('mac')
endif



" vim:ts=2:sw=2
