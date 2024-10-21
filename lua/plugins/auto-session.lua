return {
    {
        'rmagatti/auto-session',
        config = function()
            local auto_session = require('auto-session')

            auto_session.setup({
                auto_restore_enabled = true,
                auto_session_suppress_dirs = {
                    '~/',
                },
            })

            local keymap = vim.keymap

            keymap.set(
                'n',
                '<leader>ssr',
                '<cmd>SessionRestore<CR>',
                { desc = 'Restore session' }
            )
            keymap.set(
                'n',
                '<leader>sss',
                '<cmd>SessionSave<CR>',
                { desc = 'Save session' }
            )
        end,
    },
}

