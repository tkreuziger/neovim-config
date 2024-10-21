return {
    -- An interactive and powerful Git interface for Neovim, inspired by Magit.
    {
        'NeogitOrg/neogit',
        config = true,
        enabled = true,
        keys = {
            { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neogit' },
        }
    },
}
