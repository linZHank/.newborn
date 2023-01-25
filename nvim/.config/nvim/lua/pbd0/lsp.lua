-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
    return
end


lsp.preset('recommended')

lsp.ensure_installed({
    -- Replace these with whatever servers you want to install
    'sumneko_lua',
    'pyright',
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = ''
    }
})

-- the function below will be executed whenever
-- a language server is attached to a buffer
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local bind = function(keys, func, desc, opt)
        if desc then
            desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc }, opt)
    end
    bind('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame', opts)
    bind('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', opts)
    bind('gd', vim.lsp.buf.definition, '[G]oto [D]efinition', opts)
    bind('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences', opts)
    bind('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation', opts)
    bind('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition', opts)
    bind('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols', opts)
    bind('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols', opts)

    -- See `:help K` for why this keymap
    bind('K', vim.lsp.buf.hover, 'Hover Documentation', opts)
    bind('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation', opts)

    -- Lesser used LSP functionality
    bind('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration', opts)
    bind('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder', opts)
    bind('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder', opts)
    bind('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders', opts)

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

end)

-- Pass arguments to a language server
-- lsp.configure('pyright', {
--     on_attach = function(client, bufnr)
--         print('hello pyright')
--     end,
--     settings = {
--         python = {
--             analysis = {
--                 typeCheckingMode = "off"
--             }
--         }
--     }
-- })

-- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()

lsp.setup()
