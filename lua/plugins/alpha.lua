return {
    -- A lua powered greeter like vim-startify / dashboard-nvim.
    {
        'goolord/alpha-nvim',
        enabled = true,
        event = 'VimEnter',
        config = function()
            local alpha = require('alpha')
            local dashboard = require('alpha.themes.dashboard')

            -- Set header
            dashboard.section.header.val = {
                '                                                     ',
                '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
                '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
                '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
                '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
                '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
                '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
                '                                                     ',
            }

            -- Set menu
            dashboard.section.buttons.val = {
                dashboard.button('n', '󰈔  New file', '<cmd>ene<CR>'),
                dashboard.button('r', '󰋚  Recent files', '<cmd>Telescope oldfiles<CR>'),
                dashboard.button('e', '󰉋  File explorer', '<cmd>Telescope file_explorer<CR>'),
                dashboard.button('f', '󰱼  Find file', '<cmd>Telescope find_files<CR>'),
                dashboard.button('s', '  Find word', '<cmd>Telescope live_grep<CR>'),
                dashboard.button('q', '󰗼  Quit', '<cmd>qa<CR>'),
            }

            -- Send config to alpha
            alpha.setup(dashboard.opts)

            -- Disable folding on alpha buffer
            vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
        end,
    },
}
