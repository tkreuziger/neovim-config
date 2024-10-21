return {
    {
        'Exafunction/codeium.vim',
        config = function()
            vim.g.codeium_disable_bindings = 1
            vim.g.codeium_filetypes = {
                markdwon = false,
                text = false,
            }
            vim.g.codeium_enabled = false

            vim.keymap.set('n', '<leader>cc', '<cmd>CodeiumToggle<cr>')
            vim.keymap.set('n', '<leader>ca', '<cmd>Codeium Auth<cr>')
            vim.keymap.set('n', '<leader>ca', '<cmd>Codeium Auth<cr>')
            vim.keymap.set('n', '<leader>cm', '<cmd>codeium#Chat()<cr>')

            -- Neovim keybindings for codeium
            vim.keymap.set('i', '<C-g>', function()
                return vim.fn['codeium#Accept']()
            end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-f>', function()
                return vim.fn['codeium#CycleCompletions'](1)
            end, { expr = true, silent = true })
            vim.keymap.set('i', '<C-x>', function()
                return vim.fn['codeium#Clear']()
            end, { expr = true, silent = true })
        end,
    },
}
