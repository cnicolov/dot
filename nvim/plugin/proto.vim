function! proto#fmt()
  let l:curw = winsaveview()
  let l:tmpfile = tempname()
  call writefile(getline(1, "$"), l:tmpfile)
  let output = system("clang-format -i " . l:tmpfile)
  if v:shell_error == 0
    try | silent undojoin | catch | endtry
    call rename(l:tmpfile, expand("%"))
    silent edit!
    let &syntax = &syntax
  else
    echo output
    call delete(l:tmpfile)
  endif
  call winrestview(l:curw)
endfunction

augroup proto
  autocmd!
  autocmd VimEnter * command! -nargs=0 ProtoFmt call proto#fmt()
  if get(g:, "proto_fmt_on_save", 1)
    autocmd BufWritePre *.proto call proto#fmt()
  endif
augroup END
