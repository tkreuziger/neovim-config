return {
    -- A fancy, configurable, notification manager for NeoVim.
    {
        'rcarriga/nvim-notify',
        lazy = true,
        enabled = true,
        keys = {
            {
                '<leader>nx',
                function()
                    require('notify').dismiss({ silent = true, pending = true })
                end,
                desc = 'Clear notifications',
            },
            { '<leader>nn', '<cmd>Telescope notify<cr>', desc = 'Show notifications' },
        },
        opts = {
            render = 'wrapped-compact',
            stages = 'static',
            background_colour = "#1a1b26",
            timeout = 3000,
        },
    },
}
