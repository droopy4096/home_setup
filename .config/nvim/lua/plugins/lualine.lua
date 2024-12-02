  -- the opts function can also be used to change the default opts:
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "filetype")
      -- table.insert(opts.sections.lualine_x, "g:syntax")
      -- remove redundant filename info 
      opts.sections.lualine_c = {}
      -- opts.inactive_sections.lualine_c = {}
    end,
  }
