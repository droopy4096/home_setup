-- local status_ok, neo_tree = pcall(require, "neo-tree")
-- if not status_ok then
-- 	return
-- end

neo_tree = require("neo-tree")

neo_tree.setup({
	keys = {
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
	},
	config = function()
		require("neo-tree").setup()
	end,
	init = function()
		if vim.fn.argc(-1) == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				local neotree = require("neo-tree")
				neotree.show = true
			end
		end
	end,
	position = "left",
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {
                '.git',
                '.DS_Store',
                'thumbs.db',
                },
                never_show = {'.git'},
            },
        },
})
