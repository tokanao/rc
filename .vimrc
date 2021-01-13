
syntax on

set ff=unix
set ffs=unix,dos
set fenc=utf8
set fencs=utf-8,guess,ucs-bom,ucs-2le,ucs-2,iso-2022-jp-3,euc-jisx0213,euc-jp

set ic
set ts=2
set sw=2
set et
set nowrapscan
set noequalalways      " 全てのウィンドウのサイズを同じにしない
set hlsearch
set clipboard+=unnamed " デフォルトレジスタ クリップボードレジスタ使用
set shellslash
" set statusline+=%{&fenc}\ %{&ff}
set statusline=%f%m%=%l,%c\ %{'['.(&fenc!=''?&fenc:&enc).']\ ['.&fileformat.']'}

set path=$PWD/**
set path+=.\**
set path+=/usr/local/rbenv/shims/rsense
" set spell
" set spelllang=en,cjk


"行が折り返されている場合に対応
noremap j gj
noremap k gk
noremap n nzz

nmap <Space> 
nmap <C-l> :noh<CR>
nnoremap <C-p> <C-w>2-<CR>
nnoremap <C-n> <C-w>2+<CR>
" noremap <C-w><C-w> <C-w>4+<CR>

map <F2> :let @" = expand("%:p")<CR>
map <F3> :cn<CR>
map <F4> :cp<CR>
map <F7> :set wrap!<CR>

"nmap ,e :NERDTreeToggle<CR>
nmap ,e :Sexplore<CR>
nmap ,n :NERDTree<CR>
nmap ,b :NERDTreeFromBookmark <C-d>

nmap ,v :tabnew ~/.vimrc<CR>
nmap ,s :source ~/.vimrc<CR>
nmap ,t :tabnew ~/.vim/rc/dein.toml<CR>
nmap ,g :new vendor\bundle\ruby\2.4.0\gems\gentelella-rails-0.1.3<CR>

nmap fd /debugger<CR>
nmap fl /logger<CR>
nmap ft /todo<CR>
nmap ff /fixme<CR>

" コマンドで前方一致検索を行う
cnoremap <c-n>  <down>
cnoremap <c-p>  <up>

" qq で現在のファイルを実行
" silent! nmap <unique>qq <Plug>(quickrun)
let g:quickrun_config = {}
let g:quickrun_config['slim'] = {'command' : 'slimrb', 'exec' : ['%c -p %s']}
" let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c -cbp %s']}
let g:quickrun_config['coffee'] = {'command' : 'coffee', 'exec' : ['%c %s']}


" -- ChangeLog \c \o
au BufNewFile,BufRead *.changelog setf changelog
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "Naoya Tokashiki <ggtoka@gmail.com>"

au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.schema setf ruby
au BufRead,BufNewFile *.axlsx setf ruby

ab YDATE =strftime("%Y/%m/%d")<CR>

au FileType php ab errlog error_log(print_r($foo));
au FileType php set et
au FileType html set et
" au FileType ruby ab perform start_time = Time.now; p "処理概要 #{Time.now - start_time}s"
au FileType ruby ab logd logger.debug("DEBUG: params => #{params}")
au FileType ruby ab deprecated # HACK: deprecated.
au FileType ruby ab deb debugger
au FileType ruby ab pack_tag = javascript_pack_tag 'xxx_vue'<CR>= stylesheet_pack_tag 'xxx_vue'

autocmd WinEnter    * set cursorline
autocmd WinLeave    * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

" autocmd BufWinEnter,BufNewFile * silent tabo

" html tag piece jump
source $VIMRUNTIME/macros/matchit.vim
	
source ~/.unite.vim
source ~/.php.vim
source ~/.func.vim


" -- syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop', 'mri']
" let g:syntastic_javascript_checkers = "jshint"


if has("gui_win32")
  source ~/.win32.vim

elseif has('unix')
  source ~/.unix.vim

endif

source ~/.note.vim



" vim:ts=2:sw=2:fdm=marker
