return {
  'karb94/neoscroll.nvim',
  opts = {
    easing = 'quadratic',
  },
  config = function(_, opts)
    local neoscroll = require 'neoscroll'
    neoscroll.setup(opts)

    vim.keymap.set({ 'n', 'v', 'x' }, '<S-Up>', function()
      neoscroll.ctrl_u { duration = 250 }
    end, { desc = 'Half-page up' })

    vim.keymap.set({ 'n', 'v', 'x' }, '<S-Down>', function()
      neoscroll.ctrl_d { duration = 250 }
    end, { desc = 'Half-page down' })
  end,
}
