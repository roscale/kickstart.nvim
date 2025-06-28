return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    spec = {
      { '<leader>s', group = 'Search' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>gh', group = 'Git Hunk', mode = { 'n', 'v' } },
      { '<leader>l', group = 'LSP', mode = { 'n', 'v' } },
    },
  },
}
