return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup()
      require('telescope').load_extension('projects')
    end,
    keys = {
      { "<leader>P", function() require('telescope').extensions.projects.projects() end, desc = "Telescope: Projects" },
    }
  },
}
