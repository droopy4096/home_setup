-- based on https://medium.com/@shaikzahid0713/the-neovim-series-32163eb1f5d0
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("options")
require("lazy-config")
require("neo-tree-config")
-- require "nvim-tree-config"
require("lualine-config")
require("telescope-config")
require("treesitter-config")
require("whichkey-config")
require("bufferline-config")
require("gitsigns-config")
if vim.env.GITLAB_TOKEN ~= nil then
    require("gitlab-config")
end
vim.cmd.colorscheme("moonfly")
require("keymaps")
