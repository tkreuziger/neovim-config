local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local float = require('config.defaults').diagnostics_options.float

require('lazy').setup({
    -- import = require('plugins'),
    spec = {
        { import = 'plugins' },
    },
    defaults = {
        lazy = false,
    },
    checker = { enabled = false },
    change_detection = {
        enabled = false,
        notify = true,
    },
    ui = {
        border = float.border,
    },
    performance = {
        cache = {
            enabled = true,
        },
    },
})
