-- Delete default keymaps
vim.keymap.del('n', 'grn') -- LSP Rename
vim.keymap.del({ 'n', 'x' }, 'gra') -- LSP Code actions
vim.keymap.del('n', 'grr') -- LSP References
vim.keymap.del('n', 'gri') -- LSP Implementation
vim.keymap.del('n', 'gO') -- LSP Symbols

-- Clear highlights on search when pressing Esc in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode with double Esc
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Move between windows with Ctrl + Arrow keys
vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move windows with Shift + Ctrl + Arrow keys
vim.keymap.set('n', '<C-S-Left>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-Right>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-Down>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-Up>', '<C-w>K', { desc = 'Move window to the upper' })

-- Swap p and P
vim.keymap.set({ 'n', 'x' }, 'p', 'P', { noremap = true })
vim.keymap.set({ 'n', 'x' }, 'P', 'p', { noremap = true })

-- Save all files with Ctrl + s
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>wa<cr><esc>', { desc = 'Save All Files' })

-- Switch between source and header files with F10
vim.keymap.set('n', '<F10>', '<cmd>:ClangdSwitchSourceHeader<CR>', { silent = true, desc = 'Switch between source/header file' })
