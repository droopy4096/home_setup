return {
  {
    "polarmutex/git-worktree.nvim",
    config = function()
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      { "<leader>gws", function() require('telescope').extensions.git_worktree.git_worktree() end, desc = "Telescope: switch worktrees" },
      { "<leader>gwc", function() require('telescope').extensions.git_worktree.create_git_worktree() end, desc = "Telescope: create worktree" },
    },
  }
}
