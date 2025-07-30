return {
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

    set({ 'n', 'x' }, '<C-n>', function()
      mc.matchAddCursor(1)
    end)

    set({ 'n', 'x' }, '<C-S-n>', function()
      mc.deleteCursor()
    end)

    set({ 'n', 'x' }, '<C-S-M-n>', function()
      mc.matchAllAddCursors()
    end)

    -- Add and remove cursors with control + left click.
    set('n', '<C-M-leftmouse>', mc.handleMouse)
    set('n', '<C-M-leftdrag>', mc.handleMouseDrag)
    set('n', '<C-M-leftrelease>', mc.handleMouseRelease)

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
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
}
