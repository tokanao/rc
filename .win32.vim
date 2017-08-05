let ostype = "Win"

scriptencoding utf-8

let $DESKTOP=$HOME.'\Desktop'

" これないと map のキー指定が有効にならない！！
set nocompatible

set guioptions=gmrLtb
set nobk
set grepprg=findstr\ /n\ /is
set undodir=$VIM/undo
set scrolloff=5     " カーソルの上または下に表示する最小限の行数
set tags+=C:\RailsInstaller\Ruby2.1.0\lib\ruby\gems\2.1.0\gems/tags
" set noundofile
" set verbose=9     " autocmdデバッグ用


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

NeoBundleFetch "Chiel92/vim-autoformat"   " pythonは32bit'python-2.7.10.msi'を入れたら動いた
NeoBundleFetch "slim-template/vim-slim"
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'Shougo/unite.vim'
NeoBundleFetch 'Townk/vim-autoclose'
NeoBundleFetch 'alvan/vim-closetag'
NeoBundleFetch 'gmarik/Vundle.vim'
NeoBundleFetch 'hail2u/vim-css3-syntax'
NeoBundleFetch 'jphustman/Align.vim'
NeoBundleFetch 'mattn/emmet-vim'          " zen-coding
NeoBundleFetch 'othree/html5.vim'
NeoBundleFetch 'scrooloose/nerdtree'
NeoBundleFetch 'skammer/vim-css-color'
NeoBundleFetch 'thinca/vim-ref'
NeoBundleFetch 'tpope/vim-endwise'
NeoBundleFetch 'tpope/vim-fugitive'       " git
NeoBundleFetch 'tpope/vim-rails'          " Rails向けのコマンドを提供する
NeoBundleFetch 'tyru/open-browser.vim'
NeoBundleFetch 'vim-scripts/Syntastic'
NeoBundleFetch 'vim-scripts/surround.vim'
NeoBundleFetch 'vim-scripts/taglist.vim'

" need setting /xampp/php/php.ini
NeoBundleFetch 'joonty/vdebug'            " PHP xdebug - $VIM から python.dll 削除で動いた 
  " <F2> Step over
  " <F3> Step in
  " <F4> Step out
  " <F5> Run
  " <F6> Stop/close
  " <F7> Detach
  " <F9> Run to cursor

" -- code complete
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
let g:neocomplcache#sources#rsense#home_directory = '/usr/local/rbenv/shims/rsense'

let g:rsenseUseOmniFunc = 1
let g:vdebug_force_ascii = 1

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
