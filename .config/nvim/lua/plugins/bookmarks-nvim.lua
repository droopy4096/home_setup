return {
  "tomasky/bookmarks.nvim",

  config = function()
    require("bookmarks").setup{
      -- sign_priority = 8,  --set bookmark sign priority to cover other sign
      save_file = vim.fn.expand("$HOME/.bookmarks.nvim"), -- bookmarks save file path
      -- save_file = function()
      --   local project_dir = vim.fn.finddir(".git", ".;");
      --   local project_elements=vim.fn.split(project_dir, "/")
      --   local path_elements=table.unpack(project_elements, 0, vim.fn.len(project_elements) - 1 )
      --   return vim.fn.join(path_elements,"/")
      -- end,
      keywords = {
        ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
        ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
        ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
        ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
      },
      on_attach = function(bufnr)
        local bm = require("bookmarks")
        local map = vim.keymap.set
        map("n", "<leader>mb", bm.bookmark_toggle, { desc = "Bookmark toggle"}) -- add or remove bookmark at current line
        map("n", "<leader>ma", bm.bookmark_ann, {desc = "Boomark annotate"}) -- add or edit mark annotation at current line
        map("n", "<leader>mr", bm.bookmark_clean, {desc = "Bookmarks remove all"}) -- clean all marks in local buffer
        map("n", "<leader>mn", bm.bookmark_next, {desc = "Bookmark: next"}) -- jump to next mark in local buffer
        map("n", "<leader>mp", bm.bookmark_prev, {desc = "Bookmark: prev"}) -- jump to previous mark in local buffer
        map("n", "<leader>ml", bm.bookmark_list, {desc = "Bookmark list"}) -- show marked file list in quickfix window
        map("n", "<leader>mL", [[<Cmd>Telescope bookmarks list<CR>]], { desc = "Telescope: bookmark list"})
      end,
    }
    require('telescope').load_extension('bookmarks')
  end,
}
