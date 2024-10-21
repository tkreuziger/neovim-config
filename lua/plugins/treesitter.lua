return {
    -- Nvim Treesitter configurations and abstraction layer.
    {
        'nvim-treesitter/nvim-treesitter',
        enabled = true,
        build = ':TSUpdate',
        keys = {
            { '<c-space>', desc = 'Increment selection' },
            { '<bs>', desc = 'Decrement selection', mode = 'x' },
        },
        opts = {
            ensure_installed = {
                'lua',
                'python',
                'html',
                'htmldjango',
                'css',
                'json',
                'toml',
                'yaml',
                'bash',
                'markdown',
                'markdown_inline',
                'latex',
                'regex',
                'vim',
                'dockerfile',
                'rust',
                'typescript',
                'javascript',
                'tsx',
                'ruby',
                'c',
                'cpp',
                'make',
                'diff',
                'gitignore',
                'nginx',
                'ini',
                'requirements',
                'po',
            },
            sync_install = false,
            auto_install = false,
            ignore_install = {},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = {},
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<C-space>',
                    node_incremental = '<C-space>',
                    scope_incremental = '<nop>',
                    node_decremental = '<bs>',
                },
            },
            indent = {
                enable = true,
            },
            autopairs = { enable = true },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end,
    },

    -- Syntax aware text-objects, select, move, swap, and peek support.
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        enabled = true,
        build = ':TSUpdate',
        opts = {
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = {
                            query = '@function.outer',
                            desc = 'Function',
                        },
                        ['if'] = {
                            query = '@function.inner',
                            desc = 'Function',
                        },

                        ['ac'] = { query = '@class.outer', desc = 'Class' },
                        ['ic'] = { query = '@class.inner', desc = 'Class' },

                        ['as'] = {
                            query = '@scope',
                            query_group = 'locals',
                            desc = 'Scope',
                        },

                        ['a='] = {
                            query = '@assignment.outer',
                            desc = 'Assignment',
                        },
                        ['i='] = {
                            query = '@assignment.inner',
                            desc = 'Assignment',
                        },

                        ['l='] = {
                            query = '@assignment.lhs',
                            desc = 'LHS assignment',
                        },
                        ['r='] = {
                            query = '@assignment.rhs',
                            desc = 'RHS assignment',
                        },

                        ['aa'] = {
                            query = '@parameter.outer',
                            desc = 'Parameter',
                        },
                        ['ia'] = {
                            query = '@parameter.inner',
                            desc = 'Parameter',
                        },

                        ['ai'] = {
                            query = '@conditional.outer',
                            desc = 'Conditional',
                        },
                        ['ii'] = {
                            query = '@conditional.inner',
                            desc = 'Conditional',
                        },

                        ['al'] = { query = '@loop.outer', desc = 'Loop' },
                        ['il'] = { query = '@loop.inner', desc = 'Loop' },

                        ['ar'] = {
                            query = '@call.outer',
                            desc = 'Function call',
                        },
                        ['ir'] = {
                            query = '@call.inner',
                            desc = 'Function call',
                        },
                    },
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                    },
                    include_surrounding_whitespace = true,
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>lcsp'] = '@parameter.inner',
                        ['<leader>lcsf'] = '@function.outer',
                    },
                    swap_previous = {
                        ['<leader>lcsP'] = '@parameter.inner',
                        ['<leader>lcsF'] = '@function.outer',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        [']m'] = '@function.outer',
                        [']]'] = {
                            query = '@class.outer',
                            desc = 'Next class start',
                        },
                        [']o'] = '@loop.*',
                        [']s'] = {
                            query = '@scope',
                            query_group = 'locals',
                            desc = 'Next scope',
                        },
                        [']z'] = {
                            query = '@fold',
                            query_group = 'folds',
                            desc = 'Next fold',
                        },
                    },
                    goto_next_end = {
                        [']M'] = '@function.outer',
                        [']O'] = '@loop.*',
                        [']['] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[m'] = '@function.outer',
                        ['[o'] = '@loop.*',
                        ['[['] = '@class.outer',
                    },
                    goto_previous_end = {
                        ['[M'] = '@function.outer',
                        ['[O'] = '@loop.*',
                        ['[]'] = '@class.outer',
                    },
                    goto_next = {
                        [']f'] = '@conditional.outer',
                    },
                    goto_previous = {
                        ['[f'] = '@conditional.outer',
                    },
                },
                lsp_interop = {
                    enable = true,
                    border = require('config.defaults').diagnostics_options.float.border,
                    floating_preview_opts = {},
                    peek_definition_code = {},
                },
            },
        },
        config = function(_, opts)
            local ts_repeat_move =
                require('nvim-treesitter.textobjects.repeatable_move')

            local mode = { 'n', 'x', 'o' }
            vim.keymap.set(mode, ';', ts_repeat_move.repeat_last_move_next)
            vim.keymap.set(mode, ',', ts_repeat_move.repeat_last_move_previous)

            -- Make builtin f, F, t, T also repeatable with ; and ,
            vim.keymap.set(
                mode,
                'f',
                ts_repeat_move.builtin_f_expr,
                { expr = true }
            )
            vim.keymap.set(
                mode,
                'F',
                ts_repeat_move.builtin_F_expr,
                { expr = true }
            )
            vim.keymap.set(
                mode,
                't',
                ts_repeat_move.builtin_t_expr,
                { expr = true }
            )
            vim.keymap.set(
                mode,
                'T',
                ts_repeat_move.builtin_T_expr,
                { expr = true }
            )

            require('nvim-treesitter.configs').setup(opts)
        end,
    },
}
