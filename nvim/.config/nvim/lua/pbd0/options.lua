local options = {
  fileencoding = "utf-8",                  -- the encoding written to a file
  relativenumber = true,                   -- set relative numbered lines
  number = true,                           -- set numbered lines
  numberwidth = 4,                         -- set number column width {default 4}
  hlsearch = false,                        -- highlight all matches on previous search pattern
  incsearch = true,                        -- incremental search with highlights
  ignorecase = true,                       -- case insensitive
  smartcase = true,                        -- unless capital in search
  tabstop = 4,                             -- insert 2 spaces for a tab
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  expandtab = true,                        -- convert tabs to spaces
  smartindent = true,                      -- make indenting smarter again
  breakindent = true,                      -- 
  wrap = false,                            -- display lines as one long line
  smartcase = true,                        -- smart case
  swapfile = false,                        -- creates a swapfile
  backup = false,                          -- creates a backup file
  undofile = true,                         -- enable persistent undo
  scrolloff = 8,                           -- is one of my fav
  colorcolumn = "80",                      -- set reminder column
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 250,                        -- faster completion (4000ms default)
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  cursorline = true,                       -- highlight the current line
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

