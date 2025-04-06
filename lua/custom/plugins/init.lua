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
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      open_mapping = '\\',
      insert_mappings = false,
      hide_numbers = true,
      direction = 'vertical',
      size = 60,
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new {
        cmd = 'lazygit',
        hidden = true,
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
        on_open = function(term)
          vim.cmd 'startinsert!'
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
        on_close = function()
          vim.cmd 'startinsert!'
        end,
      }

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', { noremap = true, silent = true })
    end,
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
    'Pocco81/auto-save.nvim',
    opts = {},
  },
}
