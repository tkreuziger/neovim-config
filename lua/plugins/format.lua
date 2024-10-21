return {
    {
        'stevearc/conform.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local conform = require('conform')
            local x = 0
            conform.setup({
                formatters_by_ft = {
                    lua = { 'stylua' },
                    python = { 'ruff' },
                    html = { 'prettier' },
                    css = { 'prettier' },
                    json = { 'prettier' },
                    yaml = { 'prettier' },
                    markdown = { 'prettier' },
                    ruby = { 'erb-format'},
                    eruby = { 'erb-format' },
                },
                default_format_opts = {
                    lsp_format = 'fallback',
                },
            })
            vim.keymap.set({ 'n', 'v' }, '<leader>bf', function()
                conform.format({
                    lsp_fallback = true,
                    async = true,
                    timeout_ms = 1000,
                })
            end, { desc = "Format" })
        end,
        init = function()
            -- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
}

