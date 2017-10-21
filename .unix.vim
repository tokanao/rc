let ostype = system("uname")

" PuTTY mouse setting
set mouse=a
set ttymouse=xterm2
set grepprg=grep\ -inr\ $*\ /dev/null
"set paste    " PuTTY 右クリックペースト時、自動的にコメントアウトされるのを防ぐ

" -- jslint.vim
" filetype plugin on
" let $JS_CMD='node'

" javascript-libraries-syntax'
let g:used_javascript_libs = 'jquery,angularjs'
au BufReadPre *.js let b:javascript_lib_use_jquery = 1
au BufReadPre *.js let b:javascript_lib_use_underscore = 0
au BufReadPre *.js let b:javascript_lib_use_backbone = 0
au BufReadPre *.js let b:javascript_lib_use_prelude = 0
au BufReadPre *.js let b:javascript_lib_use_angularjs = 1


" Required: vim-migemo が使えれば不要
"   % git clone https://github.com/koron/cmigemo
"   % cd cmigemo
"   % ./configure
"   % make gcc
"   % make gcc-dict
"   % make gcc-install
" noremap  g/ :<C-u>Migemo<CR>


" ---- dein ---- {{{
  if &compatible
    set nocompatible
  endif

  " qq で現在のファイルを実行
  " silent! nmap <unique>qq <Plug>(quickrun)
  " let g:quickrun_config = {}
  let g:quickrun_config={'*': {'split': ''}}
  " set splitbelow
  let g:quickrun_config['slim'] = {'command' : 'slimrb', 'exec' : ['%c -p %s']}
  let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c %s']}

  " プラグインが実▒.にインストールされるディレクトリ
  let s:dein_dir = expand('~/.cache/dein')
  " dein.vim 本体                       ')
  let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

  " dein.vim がなければ github から落としてくる
  if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    "execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
    set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
  endif

  " 設定開始
  if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
  endif

  " シンタックス再設定                     <CR>
  syntax on

  " もし、未インストールものものがあったらインストール
  if dein#check_install()
    call dein#install()
  endif
" /---- dein ---- }}}


colorscheme darkblue

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
  map <F8> :!open =expand("%:p:h")<CR> -a iTerm<CR><CR>
  map <F9> :!open =expand("%:p:h")<CR> -a Finder<CR><CR>

  map r :!open -a MacVim -n =expand("%:p")<CR>
  " map r :!open -a /Applications/MacVim.app/Contents/MacOS/mvim +"set readonly" =expand("%:p")<CR>
  map g :gr  app/**/*rb<CR>
  map G :tabnew +gr\ \ app/**/*rb

  " autocmd FocusGained * set transparency=0
  " autocmd FocusLost * set transparency=50

  command! Syon     new ~/mynote/syon.changelog
  command! Snippet  new ~/mynote/snippet.txt

endif
