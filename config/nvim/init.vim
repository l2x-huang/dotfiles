execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/vimrc'

function! AdjustBorder() abort
  highlight! link WinSeparator      Whitespace
  highlight! link FloatBorder       Whitespace
  highlight! link NormalFloat       Normal
endfunction

autocmd MyAutoCmd ColorScheme * call AdjustBorder()
" autocmd MyAutoCmd FileType c,cpp color codedark


" defer settings
lua <<EOF
vim.defer_fn(function()
  vim.cmd [[
    set mouse=ni
    color candy
    " color gruvbox
    " color codedark
    " color janah
    " color ayu
  ]]
end, 0)
EOF
