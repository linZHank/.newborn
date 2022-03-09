vim.cmd [[
try
    colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme nordfox
    set background=dark
endtry
]]
