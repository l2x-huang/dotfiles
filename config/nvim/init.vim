execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/vimrc'

function! AdjustBorder() abort
  highlight! link WinSeparator      Whitespace
  highlight! link FloatBorder       Whitespace
  highlight! link NormalFloat       Normal
endfunction

autocmd MyAutoCmd ColorScheme * call AdjustBorder()

" color palenight
color candy
set mouse=ni

" color ayu
" autocmd MyAutoCmd FileType c,cpp color codedark
" color gruvbox
" color codedark
" color candy
" color janah
