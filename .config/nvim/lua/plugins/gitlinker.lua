-- Get URLs for lines of code
return {
  {
    "ruifm/gitlinker.nvim",
    config = function()
      local gl = require "gitlinker"
      gl.setup {
        mappings = nil,
      }
      vim.keymap.set('n', '<leader>gy', [[<Cmd>lua require"gitlinker".get_buf_range_url("n")<CR>]], {silent = true, desc = "Copy Line URL"})
      vim.keymap.set('v', '<leader>gY', [[<Cmd>lua require"gitlinker".get_buf_range_url("v")<CR>]], {desc = "Copy Block URL"})
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  }
}
