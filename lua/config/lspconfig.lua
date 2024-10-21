-- Helper function to extract keys from a table.
-- TODO: move to some utils file
local get_keys = function(t)
    local keys = {}
    for key, _ in pairs(t) do
        table.insert(keys, key)
    end
    return keys
end

-- Used language servers.
local servers = {
    lua_ls = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
            format = { enable = false },
            hint = { enable = true, setType = true },
        },
    },
    pyright = {},
    ts_ls = {},
    rust_analyzer = {},
    clangd = {
        cmd = {
            'clangd',
            '--clang-tidy',
            '-j=5',
            '--malloc-trim',
        },
        filetypes = { 'c' }, -- "cpp"
    },
}

local float = require('config.defaults').diagnostics_options.float

-- Define handler for lsp attach event.
local function lsp_on_attach(client, bufnr)
    require('lspconfig.ui.windows').default_options = {
        border = float.border,
    }
    local preview = require('goto-preview')

    local nmap = function(keys, func, desc)
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    -- Enable inlay hinting and allow toggling.
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
        nmap('<leader>lh', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, 'Toggle inlay hints')
    end

    if client.server_capabilities.completionProvider then
        vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    end

    -- Hover.
    if client.server_capabilities.hoverProvider then
        nmap('<leader>lk', vim.lsp.buf.hover, 'Hover documentation')
    end

    -- Signature.
    if client.server_capabilities.signatureHelpProvider then
        nmap(
            '<leader>ls',
            vim.lsp.buf.signature_help,
            'Signature documentation'
        )
    end

    nmap('<leader>lq', preview.close_all_win, 'Close previews')

    -- Code actions.
    if client.server_capabilities.renameProvider then
        nmap('<leader>lcr', vim.lsp.buf.rename, 'Rename symbol')
    end

    if client.server_capabilities.codeActionProvider then
        nmap('<leader>lca', function()
            -- vim.lsp.buf.code_action()
            require('actions-preview').code_actions()
        end, 'Code action')
    end

    -- References & stuff.
    local telescope = require('telescope.builtin')

    if client.server_capabilities.definitionProvider then
        vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
        nmap('<leader>lrd', telescope.lsp_definitions, 'Definition')
        nmap('<leader>lpd', preview.goto_preview_definition, 'Definiton')
    end

    if client.server_capabilities.declarationProvider then
        nmap('<leader>lrc', vim.lsp.buf.declaration, 'Declaration')
        nmap('<leader>lpc', preview.goto_preview_declaration, 'Declaration')
    end

    if client.server_capabilities.referencesProvider then
        nmap('<leader>lrr', telescope.lsp_references, 'References')
        nmap('<leader>lpr', preview.goto_preview_references, 'References')
    end

    if client.server_capabilities.implementationProvider then
        nmap('<leader>lri', telescope.lsp_implementations, 'Implementation')
        nmap(
            '<leader>lpi',
            preview.goto_preview_implementation,
            'Implementation'
        )
    end

    if client.server_capabilities.typeDefinitionProvider then
        nmap('<leader>lrt', telescope.lsp_type_definitions, 'Type definitions')
        nmap('<leader>lpt', preview.goto_preview_definition, 'Type definitons')
    end

    if client.server_capabilities.documentSymbolProvider then
        nmap('<leader>lrs', telescope.lsp_document_symbols, 'Document symbols')
    end

    if client.server_capabilities.workspaceSymbolProvider then
        nmap(
            '<leader>lrw',
            telescope.lsp_workspace_symbols,
            'Workspace symbols'
        )
    end

    local silent_nmap = function(keys, func, desc)
        vim.keymap.set(
            'n',
            keys,
            func,
            { buffer = bufnr, desc = desc, noremap = true, silent = true }
        )
    end

    silent_nmap('<leader>df', vim.diagnostic.open_float, 'Float')
    silent_nmap('<leader>dk', vim.diagnostic.get_prev, 'Previous issue')
    silent_nmap('<leader>dj', vim.diagnostic.get_next, 'Next issue')
    silent_nmap('<leader>dl', vim.diagnostic.setloclist, 'List')
end

-- Setup function for the individual servers.
local function setup_server(server)
    local capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
    )

    require('lspconfig')[server].setup({
        capabilities = capabilities,
        on_attach = lsp_on_attach,
        settings = servers[server],
    })
end

return {
    server_names = get_keys(servers),
    setup_server = setup_server,
}
