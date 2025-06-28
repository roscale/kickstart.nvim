return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'folke/snacks.nvim',
  },
  opts = {
    integrations = {
      snacks = true,
      diffview = true,
    },
  },
  config = function(_, opts)
    local neogit = require 'neogit'

    neogit.setup(opts)
    vim.keymap.set('n', '<leader>gg', function()
      neogit.open()
    end, { desc = 'Neogit' })
  end,
}
