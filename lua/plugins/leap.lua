return {
    -- Neovim's answer to the mouse 🦘
    {
        'ggandor/leap.nvim',
        enabled = true,
        keys = {
            { 's', '<Plug>(leap-forward)', desc = 'Leap forward' },
            { 'S', '<Plug>(leap-backward)', desc = 'Leap backward' },
        }
    },
}
