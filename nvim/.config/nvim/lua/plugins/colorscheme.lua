return {
    "EdenEast/nightfox.nvim",
    lazy=false,
    name="nightfox",
    priority=1000,
    opts = {
        styles = {
            comments = "italic",
            keywords = "bold",
            operators = "bold",
            strings = "italic",
            types = "italic,bold",
        },
    },
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nordfox]])
    end,
}
