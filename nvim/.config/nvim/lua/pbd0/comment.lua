local M = {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  lazy = false,
  commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
}

function M.config()
  require("Comment").setup {
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
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
    pre_hook = function(...)
      local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
      if loaded and ts_comment then
        return ts_comment.create_pre_hook()(...)
      end
    end,
    ---Function to call after (un)comment
    post_hook = nil,
  }
end

return M
