-- Remap for no operation.
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Keep cursor centered when jumping.
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Clear search highlight.
vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<cr>')

-- Buffer operations.
vim.keymap.set('n', '<leader>bs', '<cmd>w<cr>', { desc = 'Save buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', { desc = 'Close buffer' })

-- Close Neovim.
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit Neovim' })

-- Manage windows.
vim.keymap.set('n', '<leader>ww', '<C-W>p', { desc = 'Other window' })
vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = 'Delete window' })
vim.keymap.set('n', '<leader>ws', '<C-W>s', { desc = 'Split window below' })
vim.keymap.set('n', '<leader>wv', '<C-W>v', { desc = 'Split window right' })
vim.keymap.set('n', '<leader>w=', '<C-W>=', { desc = 'Equalize windows' })

-- Move Lines
vim.keymap.set('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- System shortcuts,.
vim.keymap.set('n', '<leader>sz', '<cmd>Lazy<cr>', { desc = 'Lazy' })
vim.keymap.set('n', '<leader>sm', '<cmd>Mason<cr>', { desc = 'Mason' })
vim.keymap.set(
    'n',
    '<leader>sf',
    '<cmd>ConformInfo<cr>',
    { desc = 'Conform Info' }
)

-- Run terminal.
vim.keymap.set('n', '<leader>st', '<cmd>HauntTerm<cr>', { desc = 'Terminal' })

-- Allow to exit insert mode in terminal.
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

-- Spelling.
vim.keymap.set(
    'n',
    '<leader>ze',
    '<cmd>setlocal spell spelllang=en_us<cr>',
    { desc = 'Spelling en_us' }
)
vim.keymap.set(
    'n',
    '<leader>zd',
    '<cmd>setlocal spell spelllang=de_de<cr>',
    { desc = 'Spelling de_de' }
)
vim.keymap.set(
    'n',
    '<leader>zz',
    '<cmd>setlocal nospell<cr>',
    { desc = 'Disbale spell check' }
)

vim.keymap.set('n', '<leader>zj', ']s', { desc = 'Next spelling error' })
vim.keymap.set('n', '<leader>zk', '[s', { desc = 'Previous spelling error' })

-- Open .ignore file.
vim.keymap.set(
    'n',
    '<leader>fi',
    '<cmd>e .ignore<cr>',
    { desc = 'Open .ignore' }
)

-- Open .gitignore file.
vim.keymap.set(
    'n',
    '<leader>gi',
    '<cmd>e .gitignore<cr>',
    { desc = 'Open .gitignore' }
)

-- Open Oil.
vim.keymap.set('n', '<leader>fo', '<cmd>Oil<cr>', { desc = 'Open Oil' })

-- Additional LSP commands.
vim.keymap.set(
    'n',
    '<leader>lR',
    '<cmd>LspRestart<cr>',
    { desc = 'Restart LSP' }
)
vim.keymap.set('n', '<leader>lL', '<cmd>LspLog<cr>', { desc = 'Show LSP log' })
vim.keymap.set('n', '<leader>li', '<cmd>LspInfo<cr>', { desc = 'LSP info' })

-- Tabs
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew<cr>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tl', '<cmd>tabnext<cr>', { desc = 'Next tab' })
vim.keymap.set(
    'n',
    '<leader>th',
    '<cmd>tabprevious<cr>',
    { desc = 'Previous tab' }
)
vim.keymap.set('n', '<leader>td', '<cmd>tabclose<cr>', { desc = 'Close tab' })
