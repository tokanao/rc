" PuTTY mouse setting
"set mouse=a
set ttymouse=xterm2

" PuTTY 右クリックペースト時、自動的にコメントアウトされるのを防ぐ
set paste



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
