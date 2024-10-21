local defaults = require('config.defaults')

return {
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            signs = defaults.icons.git,
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map({ 'n', 'v' }, '<leader>ghj', function()
                    if vim.wo.diff then
                        return ']c'
                    end
                    vim.schedule(function()
                        gs.next_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, desc = 'Next hunk' })

                map({ 'n', 'v' }, '<leader>ghk', function()
                    if vim.wo.diff then
                        return '[c'
                    end
                    vim.schedule(function()
                        gs.prev_hunk()
                    end)
                    return '<Ignore>'
                end, { expr = true, desc = 'Previous hunk' })

                -- Actions
                -- visual mode
                map('v', '<leader>ghs', function()
                    gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'Stage hunk' })
                map('v', '<leader>ghr', function()
                    gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, { desc = 'Reset hunk' })

                -- normal mode
                map(
                    'n',
                    '<leader>ghp',
                    gs.preview_hunk,
                    { desc = 'Preview hunk' }
                )
                map('n', '<leader>ghs', gs.stage_hunk, { desc = 'Stage hunk' })
                map('n', '<leader>ghr', gs.reset_hunk, { desc = 'Reset hunk' })
                map(
                    'n',
                    '<leader>ghu',
                    gs.undo_stage_hunk,
                    { desc = 'Undo stage hunk' }
                )

                map(
                    'n',
                    '<leader>gbs',
                    gs.stage_buffer,
                    { desc = 'Stage buffer' }
                )
                map(
                    'n',
                    '<leader>gbr',
                    gs.reset_buffer,
                    { desc = 'Reset buffer' }
                )
                map('n', '<leader>gbb', function()
                    gs.blame_line({ full = false })
                end, { desc = 'Blame line' })

                map(
                    'n',
                    '<leader>gbd',
                    gs.diffthis,
                    { desc = 'Diff against index' }
                )
                map('n', '<leader>gbD', function()
                    gs.diffthis('~')
                end, { desc = 'Diff against last commit' })

                -- Text object
                map(
                    { 'o', 'x' },
                    'ih',
                    ':<C-U>Gitsigns select_hunk<CR>',
                    { desc = 'select git hunk' }
                )
            end,
        },
    },
}

