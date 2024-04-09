-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  command = [[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
  ]],
})

-- LSP Bash:
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sh",
  callback = function()
    vim.lsp.start({
      name = "bash-language-server",
      cmd = { "bash-language-server", "start" },
    })
  end,
})

local bufferline = require("bufferline")
bufferline.setup({
  options = {
    mode = "buffers",
    style_preset = bufferline.style_preset.minimal,
    indicator = { style = "underline" },
    diagnostics = "nvim_lsp",
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    offsets = {
      {
        filetype = "neo-tree",
        text = "Navigation",
        text_align = "center",
        separator = true,
      },
      {
        filetype = "DiffviewFiles",
        text = "MR review",
        text_align = "center",
        separator = true,
      }
    },
    always_show_bufferline=true,
    enforce_regular_tabs=true,
  },
})
