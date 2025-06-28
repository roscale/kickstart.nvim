return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false,
    search = {
      pattern = [[\b(KEYWORDS)(\([^\)]*\))?:]],
    },
    highlight = {
      pattern = [[.*<((KEYWORDS)%(\(.{-1,}\))?):]],
    },
  },
}
