return {
    {
        'mfussenegger/nvim-dap',
        keys = {
            {
                '<leader>xR',
                function()
                    require('dap').run_to_cursor()
                end,
                desc = 'Run to Cursor',
            },
            {
                '<leader>xE',
                function()
                    require('dapui').eval(vim.fn.input('[Expression] > '))
                end,
                desc = 'Evaluate Input',
            },
            {
                '<leader>xe',
                function()
                    require('dapui').eval()
                end,
                mode = { 'n', 'v' },
                desc = 'Evaluate',
            },
            {
                '<leader>xC',
                function()
                    require('dap').set_breakpoint(
                        vim.fn.input('[Condition] > ')
                    )
                end,
                desc = 'Conditional Breakpoint',
            },
            {
                '<leader>xL',
                function()
                    require('dap').set_breakpoint(
                        nil,
                        nil,
                        vim.fn.input('Log point message: ')
                    )
                end,
                silent = true,
                desc = 'Set Breakpoint',
            },
            {
                '<leader>xU',
                function()
                    require('dapui').toggle()
                end,
                desc = 'Toggle UI',
            },
            {
                '<leader>xp',
                function()
                    require('dap').pause.toggle()
                end,
                desc = 'Pause',
            },
            {
                '<leader>xr',
                function()
                    require('dap').repl.toggle()
                end,
                desc = 'Toggle REPL',
            },
            {
                '<leader>xt',
                function()
                    require('dap').toggle_breakpoint()
                end,
                desc = 'Toggle Breakpoint',
            },
            {
                '<leader>xB',
                function()
                    require('dap').step_back()
                end,
                desc = 'Step Back',
            },
            {
                '<leader>xc',
                function()
                    require('dap').continue()
                end,
                desc = 'Continue',
            },
            {
                '<leader>xs',
                function()
                    require('dap').continue()
                end,
                desc = 'Start',
            },
            {
                '<leader>xd',
                function()
                    require('dap').disconnect()
                end,
                desc = 'Disconnect',
            },
            {
                '<leader>xg',
                function()
                    require('dap').session()
                end,
                desc = 'Get Session',
            },
            {
                '<leader>xh',
                function()
                    require('dap.ui.widgets').hover()
                end,
                desc = 'Hover Variables',
            },
            {
                '<leader>xS',
                function()
                    require('dap.ui.widgets').scopes()
                end,
                desc = 'Scopes',
            },
            {
                '<leader>xi',
                function()
                    require('dap').step_into()
                end,
                desc = 'Step Into',
            },
            {
                '<leader>xo',
                function()
                    require('dap').step_over()
                end,
                desc = 'Step Over',
            },
            {
                '<leader>xu',
                function()
                    require('dap').step_out()
                end,
                desc = 'Step Out',
            },
            {
                '<leader>xq',
                function()
                    require('dap').close()
                end,
                desc = 'Quit',
            },
            {
                '<leader>xx',
                function()
                    require('dap').terminate()
                end,
                desc = 'Terminate',
            },
            {
                '<leader>xO',
                function()
                    require('dap').repl.open()
                end,
                silent = true,
                desc = 'Repl Open',
            },
            {
                '<leader>xl',
                function()
                    require('dap').run_last()
                end,
                silent = true,
                desc = 'Run Last',
            },
        },
        dependencies = {
            {
                'rcarriga/nvim-dap-ui',
                lazy = true,
                opts = {
                    icons = {
                        expanded = '▾',
                        collapsed = '▸',
                        current_frame = '▸',
                    },
                    mappings = {
                        expand = { '<CR>', '<2-LeftMouse>' },
                        open = 'o',
                        remove = 'd',
                        edit = 'e',
                        repl = 'r',
                        toggle = 't',
                    },
                    -- Use this to override mappings for specific elements
                    element_mappings = {
                        -- Example:
                        -- stacks = {
                        --   open = "<CR>",
                        --   expand = "o",
                        -- }
                    },
                    -- Expand lines larger than the window
                    expand_lines = vim.fn.has('nvim-0.7') == 1,
                    -- Layouts define sections of the screen to place windows.
                    -- The position can be "left", "right", "top" or "bottom".
                    -- The size specifies the height/width depending on position. It can be an Int
                    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
                    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
                    -- Elements are the elements shown in the layout (in order).
                    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
                    layouts = {
                        {
                            elements = {
                                -- Elements can be strings or table with id and size keys.
                                { id = 'scopes', size = 0.4 },
                                'breakpoints',
                                'stacks',
                                -- 'watches',
                            },
                            size = 50, -- columns
                            position = 'left',
                        },
                        {
                            elements = {
                                -- 'repl',
                                'console',
                            },
                            size = 0.3, -- % of total lines
                            position = 'bottom',
                        },
                    },
                    controls = {
                        enabled = true,
                        -- Display controls in this element
                        element = 'console',
                        icons = {
                            pause = '',
                            play = '',
                            step_into = '',
                            step_over = '',
                            step_out = '',
                            step_back = '',
                            run_last = '↻',
                            terminate = '',
                        },
                    },
                    floating = {
                        max_height = nil, -- These can be integers or a float between 0 and 1.
                        max_width = nil, -- Floats will be treated as percentage of your screen.
                        border = 'single', -- Border style. Can be "single", "double" or "rounded"
                        mappings = {
                            close = { 'q', '<Esc>' },
                        },
                    },
                    windows = { indent = 1 },
                    render = {
                        max_type_length = nil, -- Can be integer or nil.
                        max_value_lines = 100, -- Can be integer or nil.
                    },
                },
                config = function(_, opts)
                    local dapui = require('dapui')
                    dapui.setup(opts)

                    local dap = require('dap')
                    dap.listeners.after.event_initialized['dapui_config'] = function()
                        dapui.open()
                    end
                    dap.listeners.before.event_terminated['dapui_config'] = function()
                        dapui.close()
                    end
                    dap.listeners.before.event_exited['dapui_config'] = function()
                        dapui.close()
                    end
                end,
            },
        },
        config = function()
            local dap = require('dap')

            dap.adapters.python = {
                type = 'executable',
                command = '/bin/python',
                args = { '-m', 'debugpy.adapter' },
            }

            dap.configurations.python = {
                {
                    type = 'python',
                    request = 'launch',
                    name = 'Launch file',
                    program = '${file}',
                    pythonPath = function()
                        return '/usr/bin/python'
                    end,
                },
            }
            dap.adapters.nlua = function(callback, config)
                callback({
                    type = 'server',
                    host = config.host,
                    port = config.port,
                })
            end

            dap.configurations.lua = {
                {
                    type = 'nlua',
                    request = 'attach',
                    name = 'Attach to running Neovim instance',
                    host = function()
                        local value = vim.fn.input('Host [127.0.0.1]: ')
                        if value ~= '' then
                            return value
                        end
                        return '127.0.0.1'
                    end,
                    port = function()
                        local val = tonumber(vim.fn.input('Port: ', '8086'))
                        assert(val, 'Please provide a port number')
                        return val
                    end,
                },
            }
        end,
    },
    {
        'julianolf/nvim-dap-lldb',
        config = function()
            require('dap-lldb').setup({})
        end,
    },
}
