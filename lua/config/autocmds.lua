-- Set up some helpers.
local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- Highlight on yank.
autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = augroup('YankHighlight'),
    pattern = '*',
})

-- Resize splits if window got resized.
autocmd({ 'VimResized' }, {
    group = augroup('resize_splits'),
    callback = function()
        vim.cmd('wincmd =')
        vim.cmd('tabdo wincmd =')
    end,
})

-- Go to the last known location when opening a file.
autocmd('BufReadPost', {
    group = augroup('restore cursor'),
    pattern = { '*' },
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] >= 1 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

local map = function(mode, lhs, rhs, opts, desc)
    opts = opts and opts or {}
    opts = vim.tbl_extend('force', opts, { desc = desc })
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Close some file types with <q>.
autocmd('FileType', {
    group = augroup('close_with_q'),
    pattern = {
        'PlenaryTestPopup',
        'help',
        'lspinfo',
        'man',
        'notify',
        'qf',
        'query',
        'spectre_panel',
        'startuptime',
        'tsplayground',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        map(
            'n',
            'q',
            '<cmd>close<cr>',
            { buffer = event.buf, silent = true },
            'close some filetype windows with <q>'
        )
    end,
})

-- Remove trailing whitespace in all files.
autocmd({ 'BufWritePre' }, { pattern = { '*' }, command = [[%s/\s\+$//e]] })

autocmd({ 'FileType' }, {
    callback = function()
        if require('nvim-treesitter.parsers').has_parser() then
            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        else
            vim.opt.foldmethod = 'syntax'
        end
    end,
})
