return {
  'nvim-neorg/neorg',
  version = '^8',
  dependencies = {
    {
      'vhyrro/luarocks.nvim',
      priority = 1000, -- We'd like this plugin to load first out of the rest
      config = true,
    },
  },
  event = 'VeryLazy',
  opts = {
    load = {
      ['core.defaults'] = {}, -- Loads default behaviour
      ['core.export'] = {}, -- Loads default behaviour
      ['core.concealer'] = {}, -- Adds pretty icons to your documents
      ['core.keybinds'] = {}, -- Adds default keybindings
      ['core.completion'] = {
        config = {
          engine = 'nvim-cmp',
        },
      }, -- Enables support for completion plugins
      ['core.integrations.nvim-cmp'] = {},
      ['core.journal'] = {}, -- Enables support for the journal module
      ['core.dirman'] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = '/home/skogix/org/neorg/skogix',
            work = '/home/skogix/org/neorg/work',
          },
          index = 'index.norg',
          default_workspace = 'work',
        },
      },
    },
  },
}
