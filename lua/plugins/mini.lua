return {
  'echasnovski/mini.nvim',
  config = function()
    local ai = require 'mini.ai'

    ai.setup {
      n_lines = 500,
      custom_textobjects = {
        o = ai.gen_spec.treesitter {
          a = { '@block.outer', '@conditional.outer', '@loop.outer' },
          i = { '@block.inner', '@conditional.inner', '@loop.inner' },
        },
        a = ai.gen_spec.treesitter { a = '@parameter.outer', i = '@parameter.inner' },
        p = ai.gen_spec.treesitter { a = '@parameter.outer', i = '@parameter.inner' },
        f = ai.gen_spec.treesitter { a = '@call.outer', i = '@call.inner' },
        F = ai.gen_spec.treesitter { a = '@function.outer', i = '@function.inner' },
        c = ai.gen_spec.treesitter { a = '@class.outer', i = '@class.inner' },
      },
    }

    require('mini.icons').setup()

    require('mini.move').setup {
      mappings = {
        left = '<M-Left>',
        right = '<M-Right>',
        down = '<M-Down>',
        up = '<M-Up>',

        line_left = '<M-Left>',
        line_right = '<M-Right>',
        line_down = '<M-Down>',
        line_up = '<M-Up>',
      },
    }

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
