return {
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
}
