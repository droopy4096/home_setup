return {
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
    -- opts = function(_, opts)
    --   local trouble = require("trouble")
    --   local symbols = trouble.statusline({
    --     mode = "lsp_document_symbols",
    --     groups = {},
    --     title = false,
    --     filter = { range = true },
    --     format = "{kind_icon}{symbol.name:Normal}",
    --     -- The following line is needed to fix the background color
    --     -- Set it to the lualine section you want to use
    --     hl_group = "lualine_c_normal",
    --   })
    --   if not opts.sections then
    --     opts.sections={}
    --   end
    --   if not opts.sections.lualine_c then
    --     opts.sections.lualine_c={}
    --   end
    --   table.insert(opts.sections.lualine_c, {
    --     symbols.get,
    --     cond = symbols.has,
    --   })
    -- end,
  },
}
