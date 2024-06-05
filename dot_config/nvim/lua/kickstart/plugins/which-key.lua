return {
  'folke/which-key.nvim',
  keys = { '<leader>' },
  config = function()
    local which_key = require 'which-key'

    which_key.setup {
      plugins = {
        spelling = {
          enabled = true,
          suggestions = 20,
        },
      },
      presets = {
        operators = true,
      },
      -- ignore_missing = true,
      window = {
        border = 'shadow',
        position = 'bottom',
        margin = { 0, 1, 1, 5 },
        padding = { 1, 2, 1, 2 },
      },
      triggers_nowait = {
        '`',
        "'",
        'g`',
        "g'",
        '"',
        '<c-r>',
        'z=',
      },
    }

    local opts = {
      prefix = '<leader>',
    }

    local binds = require 'skogix.mappings'

    which_key.register(binds, opts)
  end,
}
-- vim: ts=2 sts=2 sw=2 et
