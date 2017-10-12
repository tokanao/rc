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


" ---- neobundle ---- {{{
if has('vim_starting')
  if &compatible
   set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/*/
endif


" qq で現在のファイルを実行
" silent! nmap <unique>qq <Plug>(quickrun)
" let g:quickrun_config = {}
let g:quickrun_config={'*': {'split': ''}}
" set splitbelow
let g:quickrun_config['slim'] = {'command' : 'slimrb', 'exec' : ['%c -p %s']}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c %s']}

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'mattn/emmet-vim'
NeoBundleFetch 'tomtom/tcomment_vim'
NeoBundleFetch 'vim-scripts/taglist.vim'
NeoBundleFetch 'tpope/vim-rails'          " Rails向けのコマンドを提供する
NeoBundleFetch 'haya14busa/vim-migemo'
NeoBundleFetch 'chrisbra/SudoEdit.vim'
NeoBundleFetch 'tpope/vim-fugitive'       " git
NeoBundleFetch 'evanmiller/nginx-vim-syntax'
NeoBundleFetch "slim-template/vim-slim"
" NeoBundleFetch "vim-scripts/Conque-Shell"
NeoBundleFetch "thinca/vim-quickrun"
NeoBundleFetch "kchmck/vim-coffee-script"
NeoBundleFetch "JarrodCTaylor/vim-js2coffee"
NeoBundleFetch 'jphustman/Align.vim'
NeoBundleFetch 'scrooloose/syntastic'
NeoBundleFetch 'ngmy/vim-rubocop'
NeoBundleFetch "Chiel92/vim-autoformat"
NeoBundleFetch 'vim-scripts/SQLUtilities'
NeoBundleFetch 'othree/javascript-libraries-syntax.vim'
NeoBundleFetch "ctrlpvim/ctrlp.vim"
  let g:ctrlp_map = '<c-s>'
NeoBundleFetch "tpope/vim-abolish"        " camelcase <-> snakecase
  " crs	"SnakeCase" → "snake_case"
  " crm	"mixed_case" → "MixedCase"
  " crc	"camel_case" → "camelCase"
  " cru	"upper_case" → "UPPER_CASE"
if v:version >= 704
  NeoBundleFetch 'scrooloose/nerdtree'
  NeoBundleFetch 'Shougo/unite.vim'
  " NeoBundleFetch 'Shougo/vimfiler'
endif
if executable('rubocop')
  NeoBundleFetch "davydovanton/vim-html2slim"
endif

NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
  let g:github_user = 'tokanao'
  let g:github_token = 'd0408c10d37cf8ca6d797e4f25446b5260e7fd30'
  " let g:gist_curl_options = "-k"
  let g:gist_detect_filetype = 1

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" /---- neobundle ---- }}}


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
