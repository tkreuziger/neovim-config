-- Remap for no operation.
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Arrow keys.
vim.keymap.set('n', '<Up>', '<nop>')
vim.keymap.set('n', '<Down>', '<nop>')
vim.keymap.set('n', '<Left>', '<nop>')
vim.keymap.set('n', '<Right>', '<nop>')

vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

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
vim.keymap.set('n', '<leader>wx', '<C-W>x', { desc = 'Swap windows' })

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

-- Open Neotree as float.
vim.keymap.set('n', '<leader>ft', '<cmd>Neotree float<cr>', { desc = 'Neotree' })

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
vim.keymap.set('n', '<leader>yn', '<cmd>tabnew<cr>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>yl', '<cmd>tabnext<cr>', { desc = 'Next tab' })
vim.keymap.set(
    'n',
    '<leader>yh',
    '<cmd>tabprevious<cr>',
    { desc = 'Previous tab' }
)
vim.keymap.set('n', '<leader>yd', '<cmd>tabclose<cr>', { desc = 'Close tab' })
vim.keymap.set(
    'n',
    '<leader>yj',
    '<cmd>Tabby jump_to_tab<cr>',
    { desc = 'Jump to tab' }
)

local rename_func = function()
    local name = vim.fn.input('New tab name: ')
    if name ~= '' then
        vim.cmd('Tabby rename_tab ' .. name)
    end
end

vim.keymap.set('n', '<leader>yr', rename_func, { desc = 'Rename tab' })
