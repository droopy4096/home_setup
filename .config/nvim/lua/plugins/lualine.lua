  -- the opts function can also be used to change the default opts:

return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- FIXME: Not working code:
      -- local function git_root()
      --   return vim.fn.finddir('.git', vim.fn.expand("%:h") .. ";")
      --   -- return vim.fn.finddir('.git', ".;")
      -- end
      table.insert(opts.sections.lualine_x, "filetype")
      -- table.insert(opts.sections.lualine_x, "g:syntax")
      -- remove redundant filename info 
      -- FIXME: 
      -- opts.sections.lualine_c = { git_root }
      opts.inactive_sections.lualine_c = {}
    end,
  }
