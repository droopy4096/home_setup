-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd.colorscheme("catppuccin-mocha")
vim.cmd.colorscheme("moonfly")
vim.wo.relativenumber = false

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- vim.o.guifont = "Source Code Pro:h12" -- text below applies for VimScript
  vim.g.neovide_scale_factor = 0.8
  vim.opt.linespace = 0
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_animate_command_line = true
end

vim.api.nvim_create_user_command("JSONFormat", "<line1>,<line2>!python -m json.tool", {
  range = true,
})

vim.api.nvim_create_user_command('MDTableFormat', "<line1>,<line2>!column -t -s '|' -o '|'", {
  range = true,
})

local o = vim.o
o.tabstop = 2
o.expandtab = true
o.softtabstop = 2
o.shiftwidth = 2
