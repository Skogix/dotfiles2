-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'org',
--   callback = function()
--     vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
--       silent = true,
--       buffer = true,
--     })
--   end,
-- })
return {
  --   {
  --     'nvim-orgmode/orgmode',
  --     event = 'VeryLazy',
  --     ft = { 'org' },
  --     config = function()
  --       -- Setup orgmode
  --       require('orgmode').setup {
  --         org_agenda_files = '~/org/orgmode/**/*',
  --         org_default_notes_file = '~/org/orgmode/capture.org',
  --         -- org_hide_leading_stars = true,
  --         org_capture_templates = {
  --           l = {
  --             description = 'Link',
  --             template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
  --             target = '~/org/orgmode/links.org',
  --           },
  --           r = {
  --             description = 'Repo',
  --             template = "* [[%x][%(return string.match('%x', '([^/]+)$'))]]%?",
  --             target = '~/org/orgmode/repos.org',
  --           },
  --         },
  --       }
  --
  --       -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
  --       -- add ~org~ to ignore_install
  --       -- require('nvim-treesitter.configs').setup({
  --       --   ensure_installed = 'all',
  --       --   ignore_install = { 'org' },
  --       -- })
  --     end,
  --   },
  --   {
  --     'akinsho/org-bullets.nvim',
  --     config = function()
  --       require('org-bullets').setup()
  --     end,
  --   },
}