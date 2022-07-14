execute 'source' fnamemodify(expand('<sfile>'), ':h').'/rc/vimrc'

function! AdjustBorder() abort
  highlight! link WinSeparator      Whitespace
  highlight! link FloatBorder       Whitespace
  highlight! link NormalFloat       Normal
endfunction

autocmd MyAutoCmd ColorScheme * call AdjustBorder()
autocmd MyAutoCmd ColorScheme candy set nocursorline
" autocmd MyAutoCmd FileType c,cpp color codedark


" defer settings
lua <<EOF
vim.defer_fn(function()
  vim.cmd [[
    set cursorline
    set mouse=ni
    set nu
    " color candy
    " color gruvbox
    " color codedark
    color janah
    " color ayu
  ]]
end, 0)
EOF
