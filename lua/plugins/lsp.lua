return {
    {
        'folke/neodev.nvim',
        enabled = true,
        ft = 'lua',
        opts = {
            pathStrict = true,
            library = {
                plugins = { 'nvim-dap-ui' },
                types = true,
            },
        },
    },

    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        enabled = true,
    },

    {
        'williamboman/mason.nvim',
        enabled = true,
        opts = {
            ui = {
                border = require('config.defaults').diagnostics_options.float.border,
                icons = {
                    package_installed = '󰸞 ',
                    package_pending = '󰜴 ',
                    package_uninstalled = '󰅜 ',
                },
            },
        },
    },

    {
        'williamboman/mason-lspconfig.nvim',
        enabled = true,
        opts = {
            ensure_installed = require('config.lspconfig').server_names,
            handlers = { require('config.lspconfig').setup_server },
        },
    },

    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        enabled = true,
        opts = {
            ensure_installed = {
                'stylua',
                'selene',
                'ruff',
                'basedpyright',
                'mypy',
                'debugpy',
                'prettier',
                'eslint_d',
                'hadolint',
                'jsonlint',
                'yamllint',
                'vale',
                'rust_analyzer',
                'codelldb',
                'clangd',
            },
        },
    },

    -- A small Neovim plugin for previewing definitions using floating windows.
    {
        'rmagatti/goto-preview',
        enabled = true,
        event = 'BufEnter',
        opts = {
            border = require('config.defaults').diagnostics_options.float.border,
        },
    },
}
