return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    ---@type oil.SetupOpts
    keys = {
        { "<leader>e", "<cmd>Oil<CR>", desc = "Open Oil file explorer" },
    },
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
            -- "permissions",
            "size",
            -- "mtime",
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
            buflisted = false,
            bufhidden = "hide",
        },
        -- Window-local options to use for oil buffers
        win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
        },
        cleanup_delay_ms = 2000,
        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
            ["?"] = { "actions.show_help", mode = "n" },
            ["<CR>"] = "actions.select",
            ["<C-s>"] = { "actions.select", opts = { vertical = true } },
            ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
            ["<C-t>"] = { "actions.select", opts = { tab = true } },
            ["<C-p>"] = "actions.preview",
            ["<leader>e"] = { "actions.close", mode = "n" },
            ["<C-r>"] = "actions.refresh",
            ["-"] = { "actions.parent", mode = "n" },
            ["_"] = { "actions.open_cwd", mode = "n" },
            ["`"] = { "actions.cd", mode = "n" },
            ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
            ["so"] = { "actions.change_sort", mode = "n" },
            ["<C-o>"] = "actions.open_external",
            ["H"] = { "actions.toggle_hidden", mode = "n" },
            ["tt"] = { "actions.toggle_trash", mode = "n" },
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
            -- This function defines what is considered a "hidden" file
            is_hidden_file = function(name, bufnr)
                local m = name:match("^%.")
                return m ~= nil
            end,
            -- This function defines what will never be shown, even when `show_hidden` is set
            is_always_hidden = function(name, bufnr)
                return false
            end,
            -- Sort file names with numbers in a more intuitive order for humans.
            -- Can be "fast", true, or false. "fast" will turn it off for large directories.
            natural_order = "fast",
            -- Sort file and directory names case insensitive
            case_insensitive = false,
            sort = {
                -- sort order can be "asc" or "desc"
                -- see :help oil-columns to see which columns are sortable
                { "type", "asc" },
                { "name", "asc" },
            },
            -- Customize the highlight group for the file name
            highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
                return nil
            end,
        },
    }
}
