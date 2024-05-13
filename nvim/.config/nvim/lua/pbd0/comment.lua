local M = {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  lazy = false,
  commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>c"] = { "<Plug>(comment_toggle_linewise_current)", "Comment" },
  }

  wk.register {
    ["<leader>c"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment", mode = "v" },
  }

  vim.g.skip_ts_context_commentstring_module = true
  ---@diagnostic disable: missing-fields
  require("ts_context_commentstring").setup {
    enable_autocmd = false,
  }

  require("Comment").setup {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
      ---Line-comment toggle keymap
      line = " cc",
      ---Block-comment toggle keymap
      block = " bc",
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      ---Line-comment keymap
      line = " c",
      ---Block-comment keymap
      block = " b",
    },
    ---LHS of extra mappings
    extra = {
      ---Add comment on the line above
      above = " cO",
      ---Add comment on the line below
      below = " co",
      ---Add comment at the end of line
      eol = " cA",
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
      ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      ---Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
    },
    ---Function to call before (un)comment
    ---Function to call after (un)comment
    -- post_hook = nil,
  }
end

return M

