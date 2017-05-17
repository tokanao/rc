
syntax on

set ff=unix
set fenc=utf8

set ic
set ts=2
set sw=2
set et
set nowrapscan
set noequalalways      " 全てのウィンドウのサイズを同じにしない
set hlsearch
set clipboard+=unnamed " デフォルトレジスタ クリップボードレジスタ使用

set sh=/bin/zsh 
set path=$PWD/**


"行が折り返されている場合に対応
noremap j gj
noremap k gk
noremap n nzz

nmap <Space> 
nmap <C-l> :noh<CR>
nmap <C-p> <C-w>2-<CR>
nmap <C-n> <C-w>2+<CR>

"map <F2> :echo expand("%:p")<CR>
map <F2> :let @" = expand("%:p")<CR>
map <F3> :cn<CR>
map <F4> :cp<CR>
map <F7> :set wrap!<CR>

"nmap ,e :NERDTreeToggle<CR>
nmap ,e :Sexplore<CR>
nmap ,v :tabnew ~/.vimrc<CR>
nmap ,s :source ~/.vimrc<CR>


" -- ChangeLog \c \o
"let spec_chglog_format = "%c Naoya Tokashiki <ggtoka@gmail.com>"
au BufNewFile,BufRead *.changelog setf changelog
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "Naoya Tokashiki <ggtoka@gmail.com>"


" -- unite / no support. under vim 7.2
if v:version >= 704
  " 入力モードで開始する
  " let g:unite_enable_start_insert=1

  " バッファ一覧 - vim 7.2 では利用できない
  noremap <C-e> :Unite bookmark<CR>

  " ファイル一覧
  " noremap <C-N> :Unite -buffer-name=file file<CR>

  " 最近使ったファイルの一覧
  " noremap <C-Z> :Unite file_mru<CR>
endif


"command! Ydate execute "normal! i".strftime("%y/%m/%d ")
ab YDATE =strftime("%Y/%m/%d")<CR>

" php & eccube abbreviate {{{
" ログ出力 - data/logs
ab debuglog GC_Utils_Ex::gfDebugLog("---- TRACE ----");<left><left>
" GC_Utils_Ex::gfPrintLog("dummy", CUSTOMER_LOG_REALFILE );                 
ab debugprint SC_Utils::sfPrintR();<left><left>

ab printlog $this->p();<LEFT><LEFT>
ab tracelog $this->log("---- TRACE LOG ----".__LINE__);

ab var_dump echo "<pre style='text-align:left;'>";<CR>var_dump($_SESSION);<CR>echo "</pre>";
ab trace echo "<pre style='text-align:left;'>";<CR>var_dump(debug_print_backtrace());<CR>echo "</pre>";
ab tempurl <!--{$TPL_URLPATH}-->
" get_defined_vars()

ab debugcon <!--{debug}-->
ab dumptemplatevar <pre><!--{php}-->print_r(get_template_vars());<!--{/php}--></pre>

" <!-- {$smarty.session} -->
" <!-- {$smarty.server|@debug_print_var} -->
" <!-- {$smarty.debugging} -->

" PHP perfomance
"$time_start = microtime(true);
"printf("Process Time : %.2f [s]\n", microtime(true) - $time_start);
" /php & eccube abbreviate }}}


autocmd FileType php ab errlog error_log(print_r($foo));
autocmd FileType php set noet
autocmd FileType html set et
autocmd FileType ruby ab perform start_time = Time.now; p "処理概要 #{Time.now - start_time}s"
autocmd FileType ruby ab logd logger.debug("DEBUG: params => #{params}")
autocmd FileType ruby ab deprecated # HACK: deprecated.
autocmd FileType ruby ab bind binding.pry

	
command! -nargs=? Backup call Backup(<args>)
function! Backup(...)
  let cfile = expand("%:p")
  let sfile = cfile . "~"
  while filereadable(sfile)
    let sfile = sfile . "~"
  endwhile

  if a:0 < 1
    execute "write ".sfile
  else
    if a:1 == "pop"
      let sfile = substitute(sfile, "\\~", "", "")

      echo sfile . " -> ". cfile
      call rename(sfile, cfile)
      edit 
    else
      echo "use param 'pop' only."
    endif
  endif
endfunc

command! Tempfile call Tempfile()
function! Tempfile()
  let tmpfile = tempname()
  execute "write! " . tmpfile
endfunc

command! Reautoassignkey call Reautoassignkey()
function! Reautoassignkey()
  if &diff 
    echo "diff mode"
    map <F3> ]c
    map <F4> [c
  else
    echo "search mode"
    map <F3> :cn<CR>
    map <F4> :cp<CR>
  endif
endfunction

"nmap ,e :NERDTreeToggle<CR>
nmap ,e :Sexplore<CR>


" -- syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"
" " Required:
" " gem install rubocop
let g:syntastic_ruby_checkers=['rubocop', 'mri']

" au FileType ruby if exists('b:rails_root') |
"   \ let b:syntastic_ruby_rubocop_options = '--rails' | endif
"
" let g:vimrubocop_config = '~/.rubocop.yml'

" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
" let g:syntastic_ruby_checkers = ['rubocop']


" if has('win32')
if has("gui_win32")

  let ostype = "Win"

  scriptencoding utf-8

  let $DESKTOP=$HOME.'\Desktop'
  " let $PATH = $PATH . ';C:\Program Files (x86)\Lynx for Win32'

  " これないと map のキー指定が有効にならない！！
  set nocompatible

  set guioptions=gmrLtb
  set nobk
  set grepprg=findstr\ /n\ /is
  " set noundofile
  set undodir=$VIM/undo
  set scrolloff=5        " カーソルの上または下に表示する最小限の行数
  set ts=2
  set sw=2
  set et
  " set verbose=9           " autocmdデバッグ用

  set path+=.\**
  set tags+=C:\RailsInstaller\Ruby2.1.0\lib\ruby\gems\2.1.0\gems/tags

  " -- vim-ref
  " let g:ref_refe_cmd = $VIM.'/chrome'
  " let g:ref_phpmanual_cmd='lynx -dump %s -cfg="C:/Program Files (x86)/Lynx for Win32/lynx.cfg"'
  let g:ref_phpmanual_cmd = $VIM.'/lynx/lynx.exe -dump %s -cfg=/vim/lynx/lynx.cfg'
  let g:ref_phpmanual_path = $VIM.'/bundle/vim-ref/php-chunked-xhtml'

  " -- emmet
  " let g:user_emmet_settings = { 'variables': { 'lang' : 'ja' } } 
  let g:user_emmet_settings = { 'indentation' : '  ' }
  "let g:user_emmet_leader_key='<c-t>'

  nmap <C-s> :w<CR>

  map j :!start gvim<CR>
  map r :!start gvim -R %<CR>
  map e :set ro<CR>:!start gvim %<CR>
  map m :set lines=50<CR>:set columns=120<CR>
  map l :set lines=60<CR>
  map h :set columns=160<CR>

  " VimTip 448: Yank (copy) decimal numbers from hex numbers.
  map \y g*<esc>:let @*=@/ + 0<enter> 

  " nmap ,v :tab args $VIM/vimrc_local.vim $VIM/vimrc<CR>
  nmap ,r :pedit $VIM/vimrc_local_toka.vim<CR>

  map <F5> :new ../api/%<CR>
  nnoremap <F6> :let @* = '%'<CR>
  map <F8> :!start cmd<CR>
  map <F9> :call OpenExplorer("")<CR>

  " Move Window
  nmap <C-f> :winpos =getwinposx() + 30<CR> =getwinposy()<CR><CR>
  nmap <C-b> :winpos =getwinposx() - 30<CR> =getwinposy()<CR><CR>
  " cmap <C-f> <Right>
  " cmap <C-b> <Left>
  " nnoremap <C-f> :winpos =getwinposx() + 30<CR> =getwinposy()<CR><CR>
  " nnoremap <C-b> :winpos =getwinposx() - 30<CR> =getwinposy()<CR><CR>

  " google search
  nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>


  command! Memo       new    $VIM/mynote/memo.changelog
  command! Sacual     new    C:\Users\nao\Desktop\Sacual\secual.changelog
  command! -nargs=0 LcdCurrent lcd %:p:h
  command! English    new    C:\Users\nao\Desktop\personal\echat.txt
  command! EcLink call OpenExplorer("c:\\xampp\\htdocs\\kisekae\\html\\user_data\\packages")
  command! EcToggle call EccubeToggleByParentToEx()


  function! OpenExplorer(path)
    if empty(a:path) != 1
      execute "!start explorer " . a:path
    elseif bufname("%") == ""
      execute "!start explorer ."
    else
      execute "!start explorer /select," . expand("%")
    endif
  endfunc 

  function! EccubeToggleByParentToEx()
    let fpath = expand("%:p")
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

    execute "new " . fpath
  endfunction

  autocmd FileType smarty set ts=4
  autocmd FileType smarty set sw=4
  autocmd FileType ruby ab dbg binding.pry


  " ---- NeoBundle ---- {{{
  if has('vim_starting')
    set runtimepath+=$VIM/bundle/*/
  endif

  " Required:
  " mkdir ~/.vim/bundle
  " git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('$VIM/bundle/'))

  " Let NeoBundle manage NeoBundle
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundleFetch 'mattn/emmet-vim'          " zen-coding
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
  NeoBundleFetch 'tpope/vim-rails'          " Rails向けのコマンドを提供する
  NeoBundleFetch 'tpope/vim-endwise'
  NeoBundleFetch "slim-template/vim-slim"
  NeoBundleFetch "Chiel92/vim-autoformat"   " pythonは32bit'python-2.7.10.msi'を入れたら動いた
  NeoBundleFetch 'scrooloose/nerdtree'
  NeoBundleFetch 'tpope/vim-fugitive'       " git
  NeoBundleFetch 'gmarik/Vundle.vim'
	" need setting /xampp/php/php.ini
  NeoBundleFetch 'joonty/vdebug'            " PHP xdebug - $VIM から python.dll 削除で動いた 
    " <F2> Step over
    " <F3> Step in
    " <F4> Step out
    " <F5> Run
    " <F6> Stop/close
    " <F7> Detach
    " <F9> Run to cursor

	let g:vdebug_force_ascii = 1

  " My Bundles here:
  " Refer to |:NeoBundle-examples|.
  " Note: You don't set neobundle setting in .gvimrc!

  call neobundle#end()

  filetype plugin indent on

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck
  " /---- NeoBundle ---- }}}


  " open-browser.vim
  let g:netrw_nogx = 1 " disable netrw's gx mapping.
  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)


  " ---- ECCUBE CUSTOM ---- {{{
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
  " /---- ECCUBE CUSTOM ---- }}}

" elseif has('mac')
"   let ostype = "Mac"
"
elseif has('unix')

  let ostype = system("uname")

  " PuTTY mouse setting
  set mouse=a
  set ttymouse=xterm2
  set grepprg=grep\ -inr\ $*\ /dev/null

  set path+=.\**

  " PuTTY 右クリックペースト時、自動的にコメントアウトされるのを防ぐ
  "set paste

  " Required:
  " % git clone https://github.com/koron/cmigemo
  " % cd cmigemo
  " % ./configure
  " % make gcc
  " % make gcc-dict
  " % make gcc-install
  " vim-migemo が使えれば不要
  " noremap  g/ :<C-u>Migemo<CR>


  " ---- neobundle ---- {{{
  if has('vim_starting')
  if &compatible
   set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/*/
  endif

  nmap ,v :tabnew ~/.vimrc<CR>

  " qq で現在のファイルを実行
  " silent! nmap <unique>qq <Plug>(quickrun)
  " let g:quickrun_config = {}
  let g:quickrun_config={'*': {'split': ''}}
  " set splitbelow
  let g:quickrun_config['slim'] = {'command' : 'slimrb', 'exec' : ['%c -p %s']}
  let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c %s']}

  call neobundle#begin(expand('~/.vim/bundle/'))

  " Let NeoBundle manage NeoBundle
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundleFetch 'mattn/emmet-vim'
  NeoBundleFetch 'tomtom/tcomment_vim'
  NeoBundleFetch 'vim-scripts/taglist.vim'
  NeoBundleFetch 'tpope/vim-rails'      " Rails向けのコマンドを提供する
  NeoBundleFetch 'haya14busa/vim-migemo'
  if v:version >= 704
    NeoBundleFetch 'scrooloose/nerdtree'
    NeoBundleFetch 'Shougo/unite.vim'
    " NeoBundleFetch 'Shougo/vimfiler'
  endif
  NeoBundleFetch 'chrisbra/SudoEdit.vim'
  NeoBundleFetch 'tpope/vim-fugitive'       " git
  NeoBundleFetch 'evanmiller/nginx-vim-syntax'
  NeoBundleFetch "slim-template/vim-slim"
  " NeoBundleFetch "vim-scripts/Conque-Shell"
  NeoBundleFetch "tpope/vim-abolish"        " camelcase <-> snakecase
  " crs	"SnakeCase" → "snake_case"
  " crm	"mixed_case" → "MixedCase"
  " crc	"camel_case" → "camelCase"
  " cru	"upper_case" → "UPPER_CASE"
  NeoBundleFetch "thinca/vim-quickrun"
  NeoBundleFetch "kchmck/vim-coffee-script"
  if executable('rubocop')
    NeoBundleFetch "davydovanton/vim-html2slim"
  endif
  NeoBundleFetch "JarrodCTaylor/vim-js2coffee"
  NeoBundleFetch 'jphustman/Align.vim'
  NeoBundleFetch 'scrooloose/syntastic'
  NeoBundleFetch 'ngmy/vim-rubocop'
  NeoBundleFetch "Chiel92/vim-autoformat"
  NeoBundleFetch 'vim-scripts/SQLUtilities'

  NeoBundle 'mattn/webapi-vim'
  NeoBundle 'mattn/gist-vim'
    let g:github_user = 'tokanao'
    let g:github_token = 'd0408c10d37cf8ca6d797e4f25446b5260e7fd30'
    " let g:gist_curl_options = "-k"
    let g:gist_detect_filetype = 1

  " My Bundles here:
  " Refer to |:NeoBundle-examples|.
  " Note: You don't set neobundle setting in .gvimrc!

  call neobundle#end()

  filetype plugin indent on

  " If there are uninstalled bundles found on startup,
  " this will conveniently prompt you to install them.
  NeoBundleCheck
  " /---- neobundle ---- }}}


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

  if has('mac')
    set backupdir=/tmp

    colorscheme morning

    map m :set lines=40<CR>:set columns=100<CR>
    map l :set lines=60<CR>:set columns=100<CR>
    map h :set columns=160<CR>

    " Move Window
    nmap <C-f> :winpos =getwinposx() + 30<CR> =getwinposy()<CR><CR>
    nmap <C-b> :winpos =getwinposx() - 30<CR> =getwinposy()<CR><CR>

    " map \ <Leader>

    silent! nmap <F5> <Plug>(quickrun)
    nnoremap <F6> :let @* = '%'<CR>
    " map <F8> :!open . -a iTerm<CR><CR>
    " map <F9> :!open . -a Finder
    map <F8> :!open =expand("%:p:h")<CR> -a iTerm<CR><CR>
    map <F9> :!open =expand("%:p:h")<CR> -a Finder<CR><CR>
    map r :!open -a MacVim -n =expand("%:p")<CR>
    map g :gr  app/**/*rb<CR>
    map G :tabnew +gr\ \ app/**/*rb

    " autocmd FocusGained * set transparency=0
    " autocmd FocusLost * set transparency=50

    command! Syon     new ~/mynote/syon.changelog
    command! Snippet  new ~/mynote/snippet.txt
  endif
endif



" -------- Note. --------
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



" vim:ts=2:sw=2:fdm=marker
