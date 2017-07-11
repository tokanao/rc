
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
" set statusline+=%{&fenc}\ %{&ff}

set sh=/bin/zsh 
set path=$PWD/**
set path+=.\**
set path+=/usr/local/rbenv/shims/rsense


"行が折り返されている場合に対応
noremap j gj
noremap k gk
noremap n nzz

nmap <Space> 
nmap <C-l> :noh<CR>
nmap <C-p> <C-w>2-<CR>
nmap <C-n> <C-w>2+<CR>

map <F2> :let @" = expand("%:p")<CR>
map <F3> :cn<CR>
map <F4> :cp<CR>
map <F7> :set wrap!<CR>

"nmap ,e :NERDTreeToggle<CR>
nmap ,e :Sexplore<CR>
nmap ,v :tabnew ~/.vimrc<CR>
nmap ,s :source ~/.vimrc<CR>


" -- ChangeLog \c \o
au BufNewFile,BufRead *.changelog setf changelog
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "Naoya Tokashiki <ggtoka@gmail.com>"


ab YDATE =strftime("%Y/%m/%d")<CR>

au FileType php ab errlog error_log(print_r($foo));
au FileType php set noet
au FileType html set et
au FileType ruby ab perform start_time = Time.now; p "処理概要 #{Time.now - start_time}s"
au FileType ruby ab logd logger.debug("DEBUG: params => #{params}")
au FileType ruby ab deprecated # HACK: deprecated.
au FileType ruby ab bind binding.pry
au FileType ruby ab debugger

	
source ~/.unite.vim
source ~/.php.vim
source ~/.func.vim


" -- syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers=['rubocop', 'mri']


if has("gui_win32")
  source ~/.win32.vim

elseif has('unix')
  source ~/.unix.vim

endif


source ~/.note.vim


" vim:ts=2:sw=2:fdm=marker
