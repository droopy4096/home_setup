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

vim.g.winbar="%f"
