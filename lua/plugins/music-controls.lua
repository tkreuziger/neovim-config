return {
    {
        'AntonVanAssche/music-controls.nvim',
        dependencies = { 'rcarriga/nvim-notify' },
        opts = {
            default_player = 'spotify',
        },
        keys = {
            { '<leader>mp', '<cmd>MusicPlay<cr>', desc = 'Play/pause' },
            { '<leader>ml', '<cmd>MusicNext<cr>', desc = 'Next song' },
            { '<leader>mh', '<cmd>MusicPrev<cr>', desc = 'Previous song' },
            { '<leader>mi', '<cmd>MusicCurrent<cr>', desc = 'Info' },
        },
    },
}
