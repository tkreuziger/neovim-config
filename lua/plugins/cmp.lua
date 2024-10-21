local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
        and vim.api
                .nvim_buf_get_lines(0, line - 1, line, true)[1]
                :sub(col, col)
                :match('%s')
            == nil
end

return {
    -- Snippet Engine for Neovim written in Lua.
    {
        'L3MON4D3/LuaSnip',
        dependencies = {
            { 'rafamadriz/friendly-snippets', lazy = true },
        },
        lazy = true,
        enabled = true,
        config = function()
            local luasnip = require('luasnip')
            luasnip.config.setup({})

            luasnip.filetype_extend('python', { 'djangohtml' })
            luasnip.filetype_extend('python', { 'django' })

            require('luasnip.loaders.from_vscode').lazy_load()
        end,
    },

    -- A completion plugin for neovim coded in Lua.
    {
        'hrsh7th/nvim-cmp',
        enabled = true,
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp', lazy = true },
            { 'hrsh7th/cmp-path', lazy = true },
            { 'hrsh7th/cmp-buffer', lazy = true },
            { 'hrsh7th/cmp-nvim-lua', lazy = true },
            { 'saadparwaiz1/cmp_luasnip', lazy = true },
            { 'hrsh7th/cmp-emoji', lazy = true },
            { 'hrsh7th/cmp-cmdline', lazy = true },
            { 'hrsh7th/cmp-calc', lazy = true },
            { 'f3fora/cmp-spell', lazy = true },
            { 'chrisgrieser/cmp-nerdfont', lazy = true },
        },
        opts = function()
            local cmp = require('cmp')
            local luasnip = require('luasnip')

            local diagnostics_options =
                require('config.defaults').diagnostics_options
            local icons = require('config.defaults').icons.kinds

            local cmp_sources = {
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                luasnip = '[Snippets]',
                nvim_lua = '[Lua]',
                path = '[Path]',
                spell = '[Spell]',
                calc = '[Calc]',
                emoji = '[Emoji]',
                nerdfont = '[Nerdfont]',
                ['vim-dadbod-completion'] = '[DB]',
            }

            return {
                completion = {
                    completeopt = 'menu,menuone,preview,noselect',
                },
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = {
                        border = diagnostics_options.float.border,
                    },
                    documentation = {
                        border = diagnostics_options.float.border,
                    },
                },
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.kind = string.format(
                            '%s %s',
                            icons[vim_item.kind],
                            vim_item.kind
                        )

                        vim_item.menu = cmp_sources[entry.source.name]

                        return vim_item
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-l>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-h>'] = cmp.mapping.scroll_docs(4),
                    ['<C-j>'] = cmp.mapping.select_next_item(),
                    ['<C-k>'] = cmp.mapping.select_prev_item(),
                    ['<C-e>'] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    ['<CR>'] = cmp.mapping.confirm({ select = false }),
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),

                sources = cmp.config.sources({
                    { name = 'buffer' },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'nvim_lua' },
                    { name = 'path' },
                    { name = 'spell' },
                    { name = 'calc' },
                    { name = 'emoji' },
                    { name = 'nerdfont' },
                    { name = 'vim-dadbod-completion' },
                }),
            }
        end,
        config = function(_, opts)
            local cmp = require('cmp')
            cmp.setup(opts)

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' },
                },
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'path' },
                    { name = 'cmdline' },
                },
            })
        end,
    },
}
