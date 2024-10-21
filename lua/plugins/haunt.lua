return {
    {
        'adigitoleo/haunt.nvim',
        config = true,
        opts = {
            window =  {
                title_pos = 'center',
                winblend = 0,
                border = require('config.defaults').diagnostics_options.float.border,
            },
        }
    },
}
