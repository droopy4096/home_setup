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
    -- mode = "buffers",
    mode = "tabs",
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
    always_show_bufferline=false,
    enforce_regular_tabs=true,
  },
})


local lspconfig = require('lspconfig')

lspconfig.helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}

local wk=require('which-key')
wk.setup({
  -- use classic layout - horizontal at the bottom
  preset = "classic",
})

--[==[
vim.lsp.enable('gitlab_duo')
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if vim.lsp.inline_completion and
       client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, bufnr) then
      vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

      -- Tab to accept suggestion
      vim.keymap.set('i', '<Tab>', function()
        if vim.lsp.inline_completion.is_visible() then
          return vim.lsp.inline_completion.accept()
        else
          return '<Tab>'
        end
      end, { expr = true, buffer = bufnr, desc = 'GitLab Duo: Accept suggestion' })

      -- Alt/Option+[ for previous suggestion
      vim.keymap.set('i', '<M-[>', vim.lsp.inline_completion.select_prev,
        { buffer = bufnr, desc = 'GitLab Duo: Previous suggestion' })

      -- Alt/Option+] for next suggestion
      vim.keymap.set('i', '<M-]>', vim.lsp.inline_completion.select_next,
        { buffer = bufnr, desc = 'GitLab Duo: Next suggestion' })
    end
  end
})
--]==]
