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
function! Tempfile()    " {{{
  let tmpfile = tempname()
  execute "write! " . tmpfile
endfunc   " }}}

command! Reautoassignkey call Reautoassignkey()
function! Reautoassignkey()   " {{{
  if &diff 
    echo "diff mode"
    map <F3> ]c
    map <F4> [c
  else
    echo "search mode"
    map <F3> :cn<CR>
    map <F4> :cp<CR>
  endif
endfunction   " }}}

" Stamp factory ソース切り替え(本番 <-> テスト環境)
command! Toggle call Toggle()
function! Toggle()  " {{{
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
endfunc   " }}}

command! DSplit call DSplit()
function! DSplit()  " {{{
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
endfunc   " }}}

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
