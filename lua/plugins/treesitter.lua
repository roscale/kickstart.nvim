return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = { 'bash', 'c', 'cpp', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true },
    incremental_selection = {
      enable = true,
      init_selection = 'v',
      node_incremental = 'v',
      node_decremental = '<S-v>',
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = {
          [']a'] = '@parameter.inner',
          [']p'] = '@parameter.inner',
          [']f'] = '@function.outer',
          [']c'] = '@class.outer',
        },
        goto_next_end = {
          [']A'] = '@parameter.inner',
          [']P'] = '@parameter.inner',
          [']F'] = '@function.outer',
          [']C'] = '@class.outer',
        },
        goto_previous_start = {
          ['[a'] = '@parameter.inner',
          ['[p'] = '@parameter.inner',
          ['[f'] = '@function.outer',
          ['[c'] = '@class.outer',
        },
        goto_previous_end = {
          ['[A'] = '@parameter.inner',
          ['[P'] = '@parameter.inner',
          ['[F'] = '@function.outer',
          ['[C'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>]a'] = '@parameter.inner',
          ['<leader>]p'] = '@parameter.inner',
          ['<leader>]f'] = '@function.outer',
          ['<leader>]c'] = '@class.outer',
        },
        swap_previous = {
          ['<leader>[a'] = '@parameter.inner',
          ['<leader>[p'] = '@parameter.inner',
          ['<leader>[f'] = '@function.outer',
          ['<leader>[c'] = '@class.outer',
        },
      },
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)

    vim.keymap.set({ 'n', 'x' }, '<C-space>', require('nvim-treesitter.incremental_selection').node_incremental, { desc = 'Expand selection' })
    vim.keymap.set('x', '<C-S-space>', require('nvim-treesitter.incremental_selection').node_decremental, { desc = 'Shrink selection' })
  end,
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
