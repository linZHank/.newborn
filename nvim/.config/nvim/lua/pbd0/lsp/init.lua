local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("pbd0.lsp.installer")
require("pbd0.lsp.handlers").setup()

