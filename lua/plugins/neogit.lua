return {
    -- An interactive and powerful Git interface for Neovim, inspired by Magit.
    {
        'NeogitOrg/neogit',
        opts = {
            disable_hint = true,
            process_spinner = true,
            auto_show_console_on = 'error',
        },
        enabled = true,
        keys = {
            { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neogit' },
        }
    },
}
