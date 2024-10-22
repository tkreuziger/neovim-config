-- The changes on file indicator comes from this issue:
-- https://github.com/nanozuki/tabby.nvim/issues/125

local modified_symbol = ''

local function buf_modified(buf)
    if vim.bo[buf].modified then
        return modified_symbol
    else
        return ''
    end
end

local function tab_modified(tab)
    local wins = require('tabby.module.api').get_tab_wins(tab)
    for _, x in pairs(wins) do
        if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
            return modified_symbol
        end
    end
    return ''
end

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
                    {
                        { ' 󰓩 ', hl = theme.current },
                        line.sep(' ', theme.current, theme.fill),
                    },
                    line.tabs().foreach(function(tab)
                        local hl = tab.is_current() and theme.current
                            or theme.not_current
                        local sep = tab.is_current() and theme.current
                            or 'TabLine'
                        return {
                            line.sep('', sep, theme.fill),
                            tab.current_win().file_icon(),
                            tab.name(),
                            tab_modified(tab.id),
                            line.sep(' ', sep, theme.fill),
                            tab.jump_key(),
                            hl = hl,
                            margin = ' ',
                        }
                    end),
                    line.spacer(),
                    {
                        { '  ', hl = theme.current },
                        line.sep(' ', theme.current, theme.fill),
                    },
                    line.wins_in_tab(line.api.get_current_tab())
                        .foreach(function(win)
                            local hl = win.is_current() and theme.current
                                or theme.not_current
                            local sep = win.is_current() and theme.current
                                or 'TabLine'
                            return {
                                line.sep('', sep, theme.fill),
                                win.file_icon(),
                                win.buf_name(),
                                buf_modified(win.buf().id),
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
