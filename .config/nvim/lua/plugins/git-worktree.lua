return {
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      { "<leader>gw", function() require('telescope').extensions.git_worktree.git_worktrees() end, desc = "Telescope: worktrees" },
    },
  }
}
