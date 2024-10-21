return {
    {
        'nanozuki/tabby.nvim',
        enabled = true,
        opts = {
            line = function(line)
                local theme = {
                    current = {
                        fg = '#000000',
                        bg = '#ffffff',
                        style = 'bold',
                    },
                    not_current = { fg = '#5b6078', bg = 'transparent' },

                    fill = { bg = 'transparent' },
                }
                return {
                    line.tabs().foreach(function(tab)
                        local hl = tab.is_current() and theme.current
                            or theme.not_current
                        local sep = tab.is_current() and theme.current
                            or 'TabLine'
                        return {
                            line.sep('', sep, theme.fill),
                            tab.name(),
                            line.sep(' ', sep, theme.fill),
                            tab.jump_key(),
                            hl = hl,
                            margin = ' ',
                        }
                    end),
                    line.spacer(),
                    line.wins_in_tab(line.api.get_current_tab())
                        .foreach(function(win)
                            local hl = win.is_current() and theme.current
                                or theme.not_current
                            local sep = win.is_current() and theme.current
                                or 'TabLine'
                            return {
                                line.sep('', sep, theme.fill),
                                win.buf_name(),
                                line.sep(' ', sep, theme.fill),
                                hl = hl,
                                margin = ' ',
                            }
                        end),
                    hl = theme.fill,
                }
            end,
        },
    },
}
