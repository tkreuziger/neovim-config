vim.g.writing_mode_enabled = false

local start_writing_mode = function()
    vim.cmd.Limelight()
    vim.cmd.Goyo()
    require('lualine').hide({})
    vim.wo.cursorline = false
    vim.wo.signcolumn = 'no'

    vim.g.writing_mode_enabled = true
end

local stop_writing_mode = function()
    vim.cmd('Limelight!')
    vim.cmd.Goyo()
    require('lualine').hide({ unhide = true })
    vim.wo.cursorline = true
    vim.wo.signcolumn = 'yes'

    vim.g.writing_mode_enabled = false
end

local toggle_writing_mode = function()
    if vim.g.writing_mode_enabled then
        stop_writing_mode()
    else
        start_writing_mode()
    end
end

return {
    {
        'junegunn/goyo.vim',
        dependencies = {
            {
                'junegunn/limelight.vim',
                init = function()
                    vim.g.limelight_conceal_ctermfg = 'gray'
                    vim.g.limelight_conceal_guifg = 'gray'
                    vim.g.limelight_default_coefficient = 0.7
                    vim.g.limelight_priority = -1
                end,
            },
        },
        keys = {
            { '<leader>zw', toggle_writing_mode, desc = 'Writing mode' },
        },
    },
}
