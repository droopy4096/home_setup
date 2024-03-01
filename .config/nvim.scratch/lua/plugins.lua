return {
	-- Plugins will be added here accordingly.
	{ "folke/which-key.nvim", lazy = true },
	-- { "folke/neoconf.nvim", cmd = "Neoconf" },
	-- "folke/neodev.nvim",
	{ "catppuccin/nvim", lazy = true, name = "catppuccin", opts = {
		flavour = "mocha",
	} },
	-- { 'nvim-tree/nvim-tree.lua',
	--   lazy = true,
	--   dependencies = {
	--       'nvim-tree/nvim-web-devicons',
	--   },
	-- },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = "false", priority = 1000 },
	{ "equalsraf/neovim-gui-shim" },
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = true,
		opts = {
			open_mapping = [[<c-`>]],
		},
	},
	-- { "delphinus/dwm.nvim",
	--   enabled = false,
	--   opts = {
	--     key_maps = false,
	--     master_pane_count =2,
	--     master_pain_width = '60%',
	--   }
	-- },
	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		config = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
