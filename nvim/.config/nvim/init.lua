vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require "pbd0.launch"
require "pbd0.options"
require "pbd0.keymaps"
require "pbd0.autocmds"
spec "pbd0.colorscheme"
spec "pbd0.cmp"
spec "pbd0.comment"
spec "pbd0.autopairs"
spec "pbd0.nvimtree"
spec "pbd0.mason"
spec "pbd0.lspconfig"
spec "pbd0.schemastore"
spec "pbd0.lualine"
require "pbd0.lazy"

