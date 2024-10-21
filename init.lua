-- Enables the experimental Lua module loader.
vim.loader.enable()

-- Set up base options.
require('config.options')

-- Set up all key bindings.
require('config.keymap')

-- Set up some autocommands.
require('config.autocmds')

-- Load the lazy package manager.
require('config.lazy')

