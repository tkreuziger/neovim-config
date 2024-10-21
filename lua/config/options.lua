------------------------
-- Set up basic settings.
------------------------

-- Set leader and local leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable mouse.
vim.o.mouse = ''

-- Indentation.
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

-- Open new split panes to right and below.
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Always keep at least 8 lines below and above the cursor.
vim.o.scrolloff = 8

-- Show colored column at 80.
vim.o.colorcolumn = '80'

-- Enable clipboard integration.
vim.o.clipboard = 'unnamedplus'

-- Enable line numbers.
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Save undo history
vim.o.undofile = true
vim.o.undolevels = 30000

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience.
vim.o.completeopt = 'menuone,noselect'

-- Backspace.
vim.o.backspace = 'indent,eol,start'

-- Enable folding.
vim.opt.foldlevel = 20

-- Disable folding at startup.
vim.opt.foldenable = false

-- Set the number of screen lines above which a fold is displayed closed.
vim.opt.foldminlines = 2

-- Enable filetype stuff.
vim.cmd('filetype plugin on')

-- Time settings for keyhits.
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set correct terminal colors.
vim.o.termguicolors = true

-- Session options recommended by auto-session.
vim.o.sessionoptions =
    'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

------------------------
-- Set up diagnostics appearance.
------------------------

local defaults = require('config.defaults')
local diagnostics_options = defaults.diagnostics_options

-- Configure floating window.
vim.diagnostic.config(diagnostics_options)

-- Setup borders for handlers.
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = diagnostics_options.float.border,
})
vim.lsp.handlers['textDocument/signatureHelp'] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = diagnostics_options.float.border,
    })

-- Configure diagnostics signs.
local icons = defaults.icons.diagnostics
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = icons.Error,
            [vim.diagnostic.severity.WARN] = icons.Warn,
            [vim.diagnostic.severity.INFO] = icons.Info,
            [vim.diagnostic.severity.HINT] = icons.Hint,
        },
        linehl = {},
        numhl = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        },
    },
})
