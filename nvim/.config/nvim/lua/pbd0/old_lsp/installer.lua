local status_ok, lsp_installer = pcall(require, "mason_lspconfig")
if not status_ok then
    return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("pbd0.lsp.handlers").on_attach,
        capabilities = require("pbd0.lsp.handlers").capabilities,
    }

    if server.name == "pyright" then
        local pyright_opts = require("pbd0.lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server.name == "sumneko_lua" then
        local sumneko_opts = require("pbd0.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
