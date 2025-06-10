-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {
      highlight = { backdrop = false },
      modes = {
        char = {
          keys = { 'f', 'F', ';', ',' },
          highlight = { backdrop = false },
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x" }, function() require("flash").jump() end, desc = "Flash" },
      { "t", mode = { "n" }, function() require("flash").treesitter() end, desc = "flash treesitter" },
      { "T", mode = { "n" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },

  {
    'kylechui/nvim-surround',
    event = 'VeryLazy',
    opts = {},
  },

  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        auto_trigger = true,
      },
    },
    config = function(_, opts)
      require('copilot').setup(opts)
      vim.cmd [[highlight CopilotSuggestion guifg=#888888]]
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  },

  {
    'rmagatti/auto-session',
    opts = {},
  },

  {
    'stevearc/overseer.nvim',
    opts = {},
  },

  {
    'Civitasv/cmake-tools.nvim',
    opts = {},
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      mappings = {
        extra = false,
      },
      toggler = {
        line = 'gc',
      },
    },
    config = function(_, opts)
      vim.keymap.del('n', 'gcc')
      require('Comment').setup(opts)
    end,
  },

  {
    'jake-stewart/multicursor.nvim',
    branch = '1.0',
    config = function()
      local mc = require 'multicursor-nvim'
      mc.setup()

      local set = vim.keymap.set

      -- Add cursor above/below the main cursor.
      set({ 'n', 'x' }, '<C-M-Up>', function()
        mc.lineAddCursor(-1)
      end)
      set({ 'n', 'x' }, '<C-M-Down>', function()
        mc.lineAddCursor(1)
      end)

      -- Add a new cursor by matching word/selection
      set({ 'n', 'x' }, '<C-M-n>', function()
        mc.matchAddCursor(1)
      end)

      -- Add and remove cursors with control + left click.
      set('n', '<C-M-leftmouse>', mc.handleMouse)
      set('n', '<C-M-leftdrag>', mc.handleMouseDrag)
      set('n', '<C-M-leftrelease>', mc.handleMouseRelease)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ 'n', 'x' }, '<C-M-Left>', mc.prevCursor)
        layerSet({ 'n', 'x' }, '<C-M-Right>', mc.nextCursor)

        -- Clear cursors using escape.
        layerSet('n', '<esc>', mc.clearCursors)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, 'MultiCursorCursor', { reverse = true })
      hl(0, 'MultiCursorVisual', { link = 'Visual' })
      hl(0, 'MultiCursorSign', { link = 'SignColumn' })
      hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
    end,
  },

  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },

  {
    'gbprod/cutlass.nvim',
    opts = {
      cut_key = 'x',
    },
  },

  {
    'nvim-telescope/telescope-frecency.nvim',
    version = '*',
    config = function()
      require('telescope').load_extension 'frecency'
    end,
  },

  {
    'MagicDuck/grug-far.nvim',
    opts = {},
  },

  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    dependencies = {
      'saghen/blink.cmp',
    },
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    opt = {},
  },

  {
    'nacro90/numb.nvim',
    config = function()
      require('numb').setup()
    end,
  },

  {
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
  },

  {
    'karb94/neoscroll.nvim',
    opts = {
      easing = 'quadratic',
    },
  },

  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      integrations = {
        telescope = true,
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
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
