-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local dwm = require("dwm")
-- vim.keymap.set("n", "<S-y>", "yy")
-- -- vim.keymap.set("n", "<C-j>", "<C-w>w")
-- -- vim.keymap.set("n", "<C-k>", "<C-w>W")
-- vim.keymap.set("n", "<A-CR>", dwm.focus)
-- -- vim.keymap.set("n", "<C-@>", dwm.focus)
-- vim.keymap.set("n", "<C-Space>", dwm.focus)
-- -- vim.keymap.set("n", "<C-l>", dwm.grow)
-- -- vim.keymap.set("n", "<C-h>", dwm.shrink)
-- -- vim.keymap.set("n", "<C-n>", dwm.new)
-- -- vim.keymap.set("n", "<C-q>", dwm.rotateLeft)
-- -- vim.keymap.set("n", "<C-s>", dwm.rotate)

local tscope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", tscope.find_files, { desc = "Telescope: Find Files" })
vim.keymap.set("n", "<leader>fg", tscope.live_grep, { desc = "Telescope: live grep" })
vim.keymap.set("n", "<leader>fb", tscope.buffers, { desc = "Telescope: buffers" })
vim.keymap.set("n", "<leader>fh", tscope.help_tags, { desc = "Telescope: help tags" })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
