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

vim.keymap.set("n", "<leader>cR", vim.lsp.buf.references, {desc = "List references"})

local tscope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", tscope.find_files, { desc = "Telescope: Find Files" })
vim.keymap.set("n", "<leader>fg", tscope.live_grep, { desc = "Telescope: live grep" })
-- vim.keymap.set("n", "<leader>fb", tscope.buffers, { desc = "Telescope: buffers" })
vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")
-- open file_browser with the path of the current buffer
vim.keymap.set("n", "<space>fB", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

vim.keymap.set("n", "<leader>bL", tscope.buffers, { desc = "Telescope: buffers" })
vim.keymap.set("n", "<leader>fh", tscope.help_tags, { desc = "Telescope: help tags" })
vim.keymap.set("n", "<leader>cg", tscope.treesitter, { desc = "GoTo definition (treesitter)" })

vim.keymap.set("n", "<leader>ct", tscope.tagstack, { desc = "Telescope: Tag stack" })

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

vim.keymap.set("n", "<leader>fPr", [[<Cmd>let @+ = expand("%")<CR>]], {desc = "Copy file relative path"})
vim.keymap.set("n", "<leader>fPf", [[<Cmd>let @+ = expand("%:p")<CR>]], {desc = "Copy file full path"})
vim.keymap.set("n", "<leader>fPn", [[<Cmd>let @+ = expand("%:t")<CR>]], {desc = "Copy file name"})
vim.keymap.set("n", "<leader>fPd", [[<Cmd>let @+ = expand("%:p:h")<CR>]], {desc = "Copy directory name"})

vim.keymap.set("n", "<C-`>", [[<Cmd>ToggleTerm<CR>]])
vim.keymap.set("n", "<leader>wt", [[<Cmd>ToggleTerm<CR>]], { desc = "Terminal"})

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")

vim.keymap.set("n", "<leader>dt", [[<Cmd>diffthis<CR>]], {desc = "Toggle diff"})

local wk = require("which-key")


wk.add({
  {"<leader>d", group = "Diff" },
  {"<leader>fP", group = "File Path" },
  {"<leader>gS", group = "GitSigns" },
  {"<leader>m", group = "Bookmarks" },
  {"<leader>gw", group = "Git Worktrees" },
})



-- if vim.env.GITLAB_TOKEN ~= nil and vim.GITLAB_TOKEN ~= "" then
if vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= "" then
  local gitlab = require("gitlab")
  wk.add({
    {"<leader>gl", group = "GitLab MR" },
  })
  vim.keymap.set("n", "<leader>glrr", gitlab.review, { desc = "GitLab MR: review" })
  vim.keymap.set("n", "<leader>gls", gitlab.summary, { desc = "GitLab MR: summary" })
  vim.keymap.set("n", "<leader>glA", gitlab.approve, { desc = "GitLab MR: approve" })
  vim.keymap.set("n", "<leader>glR", gitlab.revoke, { desc = "GitLab MR: revoke" })
  vim.keymap.set("n", "<leader>glc", gitlab.create_comment, { desc = "GitLab MR: comment" })
  vim.keymap.set("v", "<leader>glc", gitlab.create_multiline_comment, { desc = "GitLab MR: multiline comment" })
  vim.keymap.set("v", "<leader>glC", gitlab.create_comment_suggestion, { desc = "GitLab MR: suggestion" })
  vim.keymap.set(
    "n",
    "<leader>glm",
    gitlab.move_to_discussion_tree_from_diagnostic,
    { desc = "GitLab MR: move to discussion tree from diagnostic" }
  )
  vim.keymap.set("n", "<leader>gln", gitlab.create_note, { desc = "GitLab MR: note" })
  vim.keymap.set("n", "<leader>gld", gitlab.toggle_discussions, { desc = "GitLab MR: toggle discussions" })
  vim.keymap.set("n", "<leader>glaa", gitlab.add_assignee, { desc = "GitLab MR: add assignee" })
  vim.keymap.set("n", "<leader>glad", gitlab.delete_assignee, { desc = "GitLab MR: delete assignee" })
  vim.keymap.set("n", "<leader>glra", gitlab.add_reviewer, { desc = "GitLab MR: add reviewer" })
  vim.keymap.set("n", "<leader>glrd", gitlab.delete_reviewer, { desc = "GitLab MR: delete reviewer" })
  vim.keymap.set("n", "<leader>glp", gitlab.pipeline, { desc = "GitLab MR: pipeline" })
  vim.keymap.set("n", "<leader>glo", gitlab.open_in_browser, { desc = "GitLab MR: open in browser" })
  -- Toggle Code Suggestions on/off with CTRL-g in normal mode:
  -- vim.keymap.set('n', '<leader>gls', '<Plug>(GitLabToggleCodeSuggestions)', { desc = "GiLab Duo: Toggle code suggestions" })
  -- vim.keymap.set('n', '<C-g>', '<Plug>(GitLabToggleCodeSuggestions)', { desc = "GitLab Duo: Toggle code suggestions" })
end

local gitsigns = require("gitsigns")

vim.keymap.set("n", "<leader>gSb", gitsigns.toggle_current_line_blame, { desc = "GitSigns: toggle line blame" })
vim.keymap.set("n", "<leader>gSd", gitsigns.diffthis, { desc = "GitSigns: diff this" })
vim.keymap.set("n", "<leader>gSD", gitsigns.toggle_deleted, { desc = "GitSigns: Toggle deleted lines" })
vim.keymap.set("n", "<leader>gSsb", gitsigns.stage_buffer, { desc = "GitSigns: Toggle deleted lines" })

local commander = require("commander")
vim.keymap.set("n", "<leader>C", gitsigns.stage_buffer, { desc = "GitSigns: Toggle deleted lines" })

vim.keymap.set("n", "<leader>xe", "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<CR>", { desc = "Show error" })

-- Trouble
vim.keymap.set("n", "<leader>xx", function()
  require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>xw", function()
  require("trouble").toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>xd", function()
  require("trouble").toggle("document_diagnostics")
end, { desc = "Document diagnostics" })
vim.keymap.set("n", "<leader>xq", function()
  require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>xl", function()
  require("trouble").toggle("loclist")
end)
vim.keymap.set("n", "gR", function()
  require("trouble").toggle("lsp_references")
end)

-- vim.keymap.set(
--     {'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't'},
--     '<C-v>',
--     function() vim.api.nvim_paste(vim.fn.getreg('+'), true, -1) end,
--     { noremap = true, silent = true }
-- )

vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Code Help" })

-- vim.keymap.set("n", "<leader>T", [[<Cmd> !cd "%h" && konsole &<CR>]], { desc = "Terminal: External" })
wk.add({
  {"<leader>T", group = "External terminals" },
})
vim.keymap.set("n", "<leader>Tk", ":!konsole --workdir=%:h &<CR>", { desc = "Terminal: External" })

if vim.env.TMUX ~= nil then
  wk.add({
    {"<leader>Tm", group = "Tmux controls" },
  })
  vim.keymap.set("n", "<leader>Tm-", ":!tmux split-window -c %:h -v -l 15<CR>", { desc = "Tmux horizontal split" })
  vim.keymap.set("n", "<leader>Tm|", ":!tmux split-window -c %:h -h<CR>", { desc = "Tmux vertical split" })
end
