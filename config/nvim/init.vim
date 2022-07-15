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
    " let base16colorspace=256
    set cursorline
    set mouse=ni
    set nu
    set rnu
    " color candy
    " color gruvbox
    " color codedark
    " color janah
    " color ayu
    " color onehalfdark
    " color base16-default-dark
    color base16-oceanicnext
  ]]
end, 0)
EOF
