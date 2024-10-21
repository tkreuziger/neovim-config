return {
    'NStefan002/screenkey.nvim',
    lazy = false,
    version = '*', -- or branch = "dev", to use the latest commit
    opts = {
        win_opts = {
            border = require('config.defaults').diagnostics_options.float.border,
        },
        show_leader = false,
    }
}
