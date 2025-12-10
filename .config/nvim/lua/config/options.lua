-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.cmd.colorscheme("catppuccin")
vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
-- :help titlestring
-- :help statusline
-- :help expand
vim.opt.titlestring = 'nvim %{expand("%:p")}'
-- vim.opt.titlestring = 'nvim %f'

vim.g.autoformat = false

-- Turn off AI 
vim.g.ai_cmp = false


-- vim.g.winbar="%f"

-- Omni-completion dialog even for single suggestion
vim.o.completeopt = 'menu,menuone'

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false

vim.g.lazyvim_picker = "telescope"

vim.opt.relativenumber = false
