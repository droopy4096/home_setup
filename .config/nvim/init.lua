-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd.colorscheme("catppuccin-mocha")
vim.cmd.colorscheme("moonfly")
vim.wo.relativenumber = false

vim.api.nvim_create_user_command("JSONFormat", "<line1>,<line2>!python -m json.tool", {
  range = true,
})
