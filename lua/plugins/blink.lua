return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    'folke/lazydev.nvim',
    'fang2hou/blink-copilot',
  },
  opts = {
    completion = {
      documentation = { auto_show = true },
    },

    sources = {
      default = { 'lsp', 'buffer', 'snippets', 'path', 'lazydev', 'copilot' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink' },
        copilot = {
          name = 'copilot',
          module = 'blink-copilot',
          score_offset = 100,
          async = true,
        },
      },
    },

    signature = { enabled = true },
  },
}
