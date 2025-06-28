return {
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
}
