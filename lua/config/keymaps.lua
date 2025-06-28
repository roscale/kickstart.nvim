vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>wa<cr><esc>', { desc = 'Save All Files' })

-- Delete default keymaps
--
-- LSP Rename
vim.keymap.del('n', 'grn')
-- LSP Code actions
vim.keymap.del({ 'n', 'x' }, 'gra')
-- LSP References
vim.keymap.del('n', 'grr')
-- LSP Implementation
vim.keymap.del('n', 'gri')
-- LSP Symbols
vim.keymap.del('n', 'gO')

-- Swap p and P
vim.keymap.set({ 'n', 'x' }, 'p', 'P', { noremap = true })
vim.keymap.set({ 'n', 'x' }, 'P', 'p', { noremap = true })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<arrow keys> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-Up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set('n', '<C-S-Left>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-Right>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-Down>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-Up>', '<C-w>K', { desc = 'Move window to the upper' })

vim.keymap.set('n', '<F10>', '<cmd>:ClangdSwitchSourceHeader<CR>', { silent = true, desc = 'Switch between source/header file' })

