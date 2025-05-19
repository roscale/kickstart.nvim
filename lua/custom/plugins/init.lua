-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
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
      set({ 'n', 'x' }, '<C-Up>', function()
        mc.lineAddCursor(-1)
      end)
      set({ 'n', 'x' }, '<C-Down>', function()
        mc.lineAddCursor(1)
      end)

      -- Add a new cursor by matching word/selection
      set({ 'n', 'x' }, '<C-n>', function()
        mc.matchAddCursor(1)
      end)
      set({ 'n', 'x' }, '<C-S-n>', function()
        mc.matchAddCursor(-1)
      end)

      -- Add and remove cursors with control + left click.
      set('n', '<C-leftmouse>', mc.handleMouse)
      set('n', '<C-leftdrag>', mc.handleMouseDrag)
      set('n', '<C-leftrelease>', mc.handleMouseRelease)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ 'n', 'x' }, '<C-Left>', mc.prevCursor)
        layerSet({ 'n', 'x' }, '<C-Right>', mc.nextCursor)

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
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
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
}
