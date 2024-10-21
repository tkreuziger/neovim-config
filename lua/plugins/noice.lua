return {
    -- 💥 Highly experimental plugin that completely replaces the UI
    -- for messages, cmdline and the popupmenu.
    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        enabled = true,
        opts = {
            presets = {
                lsp_doc_border = true,
            },
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
            },
        },
    },
}
