local M = {
  "nvim-treesitter/nvim-treesitter",
  -- event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>Ti"] = { "<cmd>TSConfigInfo<CR>", "Info" },
  }

  require("nvim-treesitter.configs").setup {
    ensure_installed = { 'bash', 'c', 'lua', 'markdown', 'markdown_inline', 'python', 'html', }, -- put the language you want in this array
    ignore_install = { "" },
    sync_install = false,
    highlight = {
      enable = true,
      -- disable = { "markdown" },
      -- additional_vim_regex_highlighting = false,
    },
    auto_install = true,
    modules = {},
    indent = {
      enable = true,
      -- disable = { "yaml" },
    },
    autopairs = { enable = true },
  }
end

return M
