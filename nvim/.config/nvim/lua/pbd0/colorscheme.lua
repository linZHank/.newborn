local util = require 'packer.util'
local status_ok, nord = pcall(require, "nord")
if not status_ok then
    return
end

vim.cmd("colorscheme nord")
