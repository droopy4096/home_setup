return {
  {
    "natecraddock/workspaces.nvim",
    enabled = false,
    config = function()
      require("workspaces").setup({ hooks = {
        open = { "Telescope find_files" },
      } })
    end,
  },
}
