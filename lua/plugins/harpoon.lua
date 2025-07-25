return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { desc = 'Harpoon mark' })

    vim.keymap.set('n', '<leader>h', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon' })

    vim.keymap.set('n', '<F1>', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon 1' })

    vim.keymap.set('n', '<F2>', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon 2' })

    vim.keymap.set('n', '<F3>', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon 3' })

    vim.keymap.set('n', '<F4>', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon 4' })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<F5>', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon previous' })

    vim.keymap.set('n', '<F6>', function()
      harpoon:list():next()
    end, { desc = 'Harpoon next' })
  end,
}
