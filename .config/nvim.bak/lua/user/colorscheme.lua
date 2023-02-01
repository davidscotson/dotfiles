vim.cmd [[
try
  colorscheme unreadable
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
