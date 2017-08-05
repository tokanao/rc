let ostype = "Win"

scriptencoding utf-8

let $DESKTOP=$HOME.'\Desktop'

" これないと map のキー指定が有効にならない！！
set nocompatible

set guioptions=gmrLtb
set nobk
set grepprg=findstr\ /n\ /is
set scrolloff=5        " カーソルの上または下に表示する最小限の行数
" set verbose=9           " autocmdデバッグ用

set path+=.\**
set tags+=C:\RailsInstaller\Ruby2.1.0\lib\ruby\gems\2.1.0\gems/tags

" Not working win network drive
set noundofile
" set undodir=$VIM/undo

" -- vim-ref
" let g:ref_refe_cmd = $VIM.'/chrome'
" let g:ref_phpmanual_cmd='lynx -dump %s -cfg="C:/Program Files (x86)/Lynx for Win32/lynx.cfg"'
let g:ref_phpmanual_cmd = $VIM.'/lynx/lynx.exe -dump %s -cfg=/vim/lynx/lynx.cfg'
let g:ref_phpmanual_path = $VIM.'/bundle/vim-ref/php-chunked-xhtml'

" -- syntastic :Errors
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers=['rubocop', 'mri']

" -- emmet <C-Y>,
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

map G :tabnew +gr\ \ app/**

" VimTip 448: Yank (copy) decimal numbers from hex numbers.
map \y g*<esc>:let @*=@/ + 0<enter> 

" nmap ,v :tab args $VIM/vimrc_local.vim $VIM/vimrc<CR>
nmap ,r :pedit $VIM/vimrc_local_toka.vim<CR>

map <F5> :new ../api/%<CR>
nnoremap <F6> :let @* = '%'<CR>
" map <F8> :!start cmd<CR>
map <F8> :set statusline+=%{&fenc}\ %{&ff}<CR>
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

au FileType smarty set ts=4
au FileType smarty set sw=4


" ---- NeoBundle ---- {{{
if has('vim_starting')
  set runtimepath+=$VIM/bundle/*/
endif

" Required:
"   mkdir ~/.vim/bundle
"   git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
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
NeoBundleFetch "kchmck/vim-coffee-script"
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
NeoBundleFetch "thinca/vim-quickrun"
NeoBundleFetch "tpope/vim-abolish"        " camelcase <-> snakecase
" crs	"SnakeCase" → "snake_case"
" crm	"mixed_case" → "MixedCase"
" crc	"camel_case" → "camelCase"
" cru	"upper_case" → "UPPER_CASE"
NeoBundleFetch 'mattn/gist-vim'           " not work, so not installed curl
  let g:github_user = 'tokanao'
  let g:github_token = 'd0408c10d37cf8ca6d797e4f25446b5260e7fd30'
  let g:gist_detect_filetype = 1
  " let g:gist_curl_options = "-k"

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
