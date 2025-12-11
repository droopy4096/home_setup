return {
  {
    "polarmutex/git-worktree.nvim",
    config = function()
      require("telescope").load_extension("git_worktree")
      local Hooks = require("git-worktree.hooks")
      local config = require('git-worktree.config')
      local update_on_switch = Hooks.builtins.update_current_buffer_on_switch

      Hooks.register(Hooks.type.SWITCH, function (path, prev_path)
        vim.notify("Moved from " .. prev_path .. " to " .. path)
        update_on_switch(path, prev_path)
      end)

      Hooks.register(Hooks.type.DELETE, function ()
        vim.cmd(config.update_on_change_command)
      end)
    end,
    keys = {
      { "<leader>gws", function() require('telescope').extensions.git_worktree.git_worktree() end, desc = "Telescope: switch worktrees" },
      { "<leader>gwc", function() require('telescope').extensions.git_worktree.create_git_worktree() end, desc = "Telescope: create worktree" },
    },
  }
}
