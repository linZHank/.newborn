local M = {
  "shaunsingh/nord.nvim",
  commit = "fab04b2dd4b64f4b1763b9250a8824d0b5194b8f",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

M.name = "nord"
function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
