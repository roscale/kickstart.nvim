return {
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
}
