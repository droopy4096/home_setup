return {
  {
    'f-person/git-blame.nvim',
    config = function()
      vim.g.gitblame_message_template = '  <sha> <date> <author> <summary>'
      vim.g.gitblame_highlight_group = 'DiagnosticSource'
      vim.g.gitblame_enabled = 0
      local gitblame = require("gitblame")
      gitblame.setup {
        ebabled = false
      }
      vim.keymap.set("n", "<leader>gb", [[<Cmd>GitBlameToggle<CR>]], {desc = "Toggle Git Blame"})
      vim.keymap.set("n", "<leader>gu", [[<Cmd>GitBlameCopyFileURL<CR>]], {desc = "Copy file URL"})
      vim.keymap.set("n", "<leader>gU", [[<Cmd>GitBlameOpenFileURL<CR>]], {desc = "Open file URL"})
      vim.keymap.set("n", "<leader>gs", [[<Cmd>GitBlameCopySHA<CR>]], {desc = "Copy blame SHA"})
      vim.keymap.set("n", "<leader>gC", [[<Cmd>GitBlameCopyCommitURL<CR>]], {desc = "Copy commit URL"})
    end
  }
}
