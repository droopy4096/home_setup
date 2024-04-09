-- Make buffers scoped to tabs
-- (should help with bufferline)
return {
  { "tiagovla/scope.nvim",
    config = function()
      require("telescope").load_extension("scope")
      local tscope = require("telescope.builtin")
      -- vim.keymap.set("n", "<leader>bs", tscope.scope.buffers, { desc = "Telescope: scope buffers" })
      vim.keymap.set("n", "<leader>bs", [[<Cmd>Telescope scope buffers<CR>]], opts)
    end
  }
}
