vim.g.linting_enabled = true

return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        linters_by_ft = {
            lua = { 'selene' },
            python = { 'ruff', 'mypy' },
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
            typescriptreact = { 'eslint_d' },
            dockerfile = { 'hadolint' },
            json = { 'jsonlint' },
            yaml = { 'yamllint' },
            janet = { 'janet' },
        },
    },
    config = function()
        local lint = require('lint')

        local lint_augroup =
            vim.api.nvim_create_augroup('lint', { clear = true })

        vim.api.nvim_create_autocmd(
            { 'BufEnter', 'BufWritePost', 'InsertLeave' },
            {
                group = lint_augroup,
                callback = function()
                    if vim.g.linting_enabled then
                        lint.try_lint()
                    end
                end,
            }
        )

        local toggle_lint = function()
            vim.g.linting_enabled = not vim.g.linting_enabled

            if not vim.g.linting_enabled then
                vim.diagnostic.reset(nil, 0)
            else
                lint.try_lint()
            end
        end

        vim.keymap.set('n', '<leader>bl', function()
            lint.try_lint()
        end, { desc = 'Lint file' })
        vim.keymap.set(
            'n',
            '<leader>ll',
            toggle_lint,
            { desc = 'Toggle linting' }
        )
    end,
}
