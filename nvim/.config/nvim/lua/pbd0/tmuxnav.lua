local M = {
  "christoomey/vim-tmux-navigator",
  commit = "38b1d0402c4600543281dc85b3f51884205674b6",
  lazy = false,
}

function M.config()
  local status_ok, tmuxnav = pcall(require, "vim-tmux-navigator")
  if not status_ok then
    return
  end

  tmuxnav.setup {
    cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    },
    keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  }
end

return M

