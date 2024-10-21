return {
    {
        'folke/trouble.nvim',
        opts = {
            focus = true,
        },
        cmd = 'Trouble',
        keys = {
            {
                '<leader>dW',
                '<cmd>Trouble diagnostics toggle<CR>',
                desc = 'Trouble workspace',
            },
            {
                '<leader>dD',
                '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
                desc = 'Trouble document',
            },
            {
                '<leader>dq',
                '<cmd>Trouble quickfix toggle<CR>',
                desc = 'Trouble quickfix list',
            },
            {
                '<leader>dL',
                '<cmd>Trouble loclist toggle<CR>',
                desc = 'Trouble location list',
            },
            {
                '<leader>dt',
                '<cmd>Trouble todo toggle<CR>',
                desc = 'Open todos in trouble',
            },
        },
    },
}

