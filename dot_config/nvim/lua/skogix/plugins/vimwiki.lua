--
-- vim.g.vimwiki_list = {
--   {
--     path = '~/scripts/vimwiki/notewiki',
--     syntax = 'markdown',
--     ext = '.md',
--   },
-- }
-- vim.g.vimwiki_ext2syntax = {
--   ['.md'] = 'markdown',
--   ['.markdown'] = 'markdown',
--   ['.mdown'] = 'markdown',
-- }
-- vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki (0)
-- vim.g.vimwiki_folding = "list"
-- vim.g.vimwiki_hl_headers = 1  -- use alternating colours for different heading levels
-- vim.g.vimwiki_markdown_link_ext = 1 -- add markdown file extension when generating links
-- vim.g.taskwiki_markdown_syntax = "markdown"
-- vim.g.indentLine_conceallevel = 2 -- indentline controlls concel
-- --vim.set.o.conceallevel = 1 -- so that I can see `` and full urls in markdown files
-- vim.api.nvim_set_keymap("n", "<F3>", ":VimwikiDiaryPrevDay<CR>", { noremap = true, silent = true, nowait = true })
-- vim.api.nvim_set_keymap("n", "<F4>", ":VimwikiDiaryNextDay<CR>", { noremap = true, silent = true, nowait = true })
--
-- vim.cmd [[
--  autocmd BufNewFile */diary/????-??-??.md call New_vimwiki_diary_template()
--
-- function New_vimwiki_diary_template()
-- "" If it's Friday, open a end of week lookback template
--    if system('date +%u') == 5
--         read ~/vimwiki/Diary\ TemplateEndOfWeek.md | execute "normal ggdd"
--     else
--         read  ~/vimwiki/Diary\ Template.md | execute "normal ggdd"
--     end
--  endfunction
-- ]]
--
-- -- Function to create taskwiki
-- function vimwikiSubtask(text)
--   local pos = vim.api.nvim_win_get_cursor(0)[2]
--   local line = vim.api.nvim_get_current_line()
--   -- Lua string concat is done via .. instead of + : "text" .. var is equiv to "text" + var in most languages
--   local txt = "##" .. text .. " || project:" .. text
--   local nline = line:sub(0, pos) .. txt .. line:sub(pos + 1)
--   vim.api.nvim_set_current_line(nline)
-- end
--
-- -- This was pretty hard to find - how to pass an argument to a vim function : https://stackoverflow.com/questions/3213657/vim-how-to-pass-arguments-to-functions-from-user-commands
-- -- Also need to use a syntax like command! <commandName> lua <lua function>() as the generic way to map a lua function to a vim cmd
-- vim.cmd([[command! -nargs=1 VimWikiSubTask lua vimwikiSubtask(<f-args>)]])

return {
  {
    'vimwiki/vimwiki',
    branch = 'dev',
    -- event = 'BufEnter *.md', -- eventet körs på keys
    -- keys = {
    --   { '<leader>ww', '<cmd>VimwikiIndex<cr>', desc = 'index' },
    --   { '<leader>wt', '<cmd>VimwikiDiaryIndex<cr>', desc = 'diary' },
    -- },
    init = function()
      -- vim.g.vimwiki_folding = 'custom'
      vim.g.vimwiki_folding = 'list'
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
      -- vim.g.vimwiki_key_mappings = {
      --   all_maps = 0,
      --   global = 0,
      -- }
      vim.g.vimwiki_path = '/home/skogix/org/'
      vim.g.vimwiki_html_path = '/home/skogix/org/html/'
      vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki (0)
      vim.g.vimwiki_hl_headers = 1 -- use alternating colours for different heading levels
      vim.g.vimwiki_markdown_link_ext = 1 -- add markdown file extension when generating links
      vim.g.taskwiki_markdown_syntax = 'markdown'
      vim.g.indentLine_conceallevel = 2 -- indentline controlls concel
      -- let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path': '~/vimwiki/templates/',
      --           \ 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md',
      --           \ 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown',
      --           \ 'html_filename_parameterization': 1,
      --           \ 'template_ext': '.tpl'}]
      vim.g.vimwiki_list = {
        {
          path = '~/org/',
          template_path = '~/org/templates/',
          template_default = 'default',
          syntax = 'markdown',
          ext = '.md',
          path_html = '~/org/site_html',
          custom_wiki2html = 'vimwiki_markdown',
          html_filename_parameterization = 1,
          template_ext = '.tpl',
        },
      }
      -- vim.g.vimwiki_ext2syntax = {}
      -- vim.g.vimwiki_global_ext = 0
    end,
    config = function() end,
  },
  {
    'tools-life/taskwiki',
  },
}
