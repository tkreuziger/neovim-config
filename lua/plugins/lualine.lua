return {
    -- A blazing fast and easy to configure neovim statusline plugin written in
    -- pure lua.
    {
        'nvim-lualine/lualine.nvim',
        enabled = true,
        opts = function()
            local function total_num_lines()
                return vim.api.nvim_buf_line_count(0)
            end

            local lint_progress = function()
                if not vim.g.linting_enabled then
                    return ' '
                end
                local linters = require('lint').get_running()
                if #linters == 0 then
                    return ' '
                end
                return '󱉶 ' .. table.concat(linters, ', ')
            end

            local codeium = function()
                local response =
                    vim.api.nvim_call_function('codeium#GetStatusString', {})

                if response == 'OFF' then
                    return '󱚧 '
                end

                local prefix = '󰚩 '
                if response == ' ON' then
                    return prefix
                end
                if response == ' * ' then
                    return prefix .. '󰃨 '
                end

                return prefix .. response
            end

            local is_recording = function()
                local rec = vim.fn.reg_recording()

                if rec == '' then
                    return ''
                end

                return '󰑋  ' .. rec
            end

            return {
                options = {
                    theme = 'catppuccin',
                    component_separators = '|',
                    section_separators = { left = ' ', right = ' ' },
                },
                sections = {
                    lualine_a = {
                        {
                            'mode',
                            separator = { right = ' ' },
                            right_padding = 2,
                        },
                    },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {
                        {
                            'filename',
                            file_status = true,
                            path = 1,
                        },
                    },
                    lualine_x = {
                        'searchcount',
                        is_recording,
                        codeium,
                        lint_progress,
                    },
                    lualine_y = { 'encoding', 'fileformat', 'filetype' },
                    lualine_z = { 'location', total_num_lines },
                },
            }
        end,
    },
}
