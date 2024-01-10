local M = {
  "shaunsingh/nord.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  commit = "80c1e5321505aeb22b7a9f23eb82f1e193c12470",
}

M.name = "nord"
function M.config()
  local status_ok, _ = pcall(vim.cmd.colorscheme, M.name)
  if not status_ok then
    return
  end
end

return M
