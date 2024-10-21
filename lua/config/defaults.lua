return {
    icons = {
        diagnostics = {
            Error = '󰅚',
            Warn = '󰀪',
            Hint = '󰌶',
            Info = '󰗡',
        },
        debugger = {
            DapBreakpoint = ' ',
            DapBreakpointCondition = ' ',
            DapLogPoint = ' ',
            DapStopped = ' ',
            DapBreakpointRejected = ' ',
        },
        git = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '-' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
            untracked = { text = '┆' },
        },
        kinds = {
            Array = ' ',
            Boolean = ' ',
            Class = '󰠱 ',
            Color = '󰏘 ',
            Constant = ' ',
            Constructor = '',
            Enum = ' ',
            EnumMember = '',
            Event = ' ',
            Field = '󰄶 ',
            File = '󰈙',
            Folder = '  ',
            Function = '󰡱 ',
            Interface = ' ',
            Keyword = '󰌋 ',
            Method = '󰆧 ',
            Module = ' ',
            Namespace = ' ',
            Null = ' ',
            Number = ' ',
            Object = ' ',
            Operator = '󰆕 ',
            Package = '󰏗 ',
            Property = '󱉯 ',
            Reference = ' ',
            Snippet = ' ',
            String = ' ',
            Struct = ' ',
            Text = '󰊄 ',
            TypeParameter = ' ',
            Unit = ' ',
            Value = '󰎠',
            Variable = '󰘛 ',
        },
    },
    diagnostics_options = {
        -- virtual_text = false,
        virtual_text = {
            severity = {
                min = vim.diagnostic.severity.WARN,
                max = vim.diagnostic.severity.ERROR,
            },
            source = 'if_many',
            spacing = 0,
            prefix = ' ',
        },
        float = {
            relative = 'cursor',
            border = 'rounded',
            max_width = math.floor(vim.o.columns * 0.84),
            max_height = math.floor(vim.o.lines * 0.6),
            close_events = {
                'BufLeave',
                'CursorMoved',
                'InsertEnter',
                'FocusLost',
            },
            focusable = false,
            zindex = 3,
            focus = false,
            source = 'if_many',
            severity_sort = true,
        },
        update_in_insert = false,
        severity_sort = true,
    },
}
