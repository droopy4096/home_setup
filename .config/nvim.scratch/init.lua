vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("options")
require("lazy-config")
require "neo-tree-config"
-- require "nvim-tree-config"
require("lualine-config")
require("whichkey")
vim.cmd.colorscheme("moonfly")
