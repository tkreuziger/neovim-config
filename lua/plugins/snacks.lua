return {
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = {
                enabled = true,
                notify = true,
                size = 1024 * 1024, -- 1 MB
            },
            dashboard = { enabled = false },
            indent = { enabled = true },
            input = { enabled = true },
            notify = { enabled = false },
            notifier = { enabled = false },
            quickfile = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = false },
        },
        keys = {
            {
                '<leader>bd',
                function()
                    Snacks.bufdelete()
                end,
                desc = 'Close buffer',
            },
        },
    },
}
