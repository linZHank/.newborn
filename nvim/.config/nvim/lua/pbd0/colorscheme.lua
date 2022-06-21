local util = require 'packer.util'
local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
    return
end

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
    options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = false,    -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false,   -- Non focused panes set to alternative background
        styles = {              -- Style to be applied to different syntax groups
        comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
        functions = "italic",
        keywords = "italic,bold",
        numbers = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
    match_paren = false,
    visual = false,
    search = false,
},
modules = {             -- List of various plugins and additional options
-- ...
    },
}
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")

