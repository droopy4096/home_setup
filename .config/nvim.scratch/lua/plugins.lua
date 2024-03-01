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
    {
        'nvim-telescope/telescope.nvim',
        lazy = true,
        dependencies = {
            {'nvim-lua/plenary.nvim'},
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
    },
    {
        "lewis6991/gitsigns.nvim",
    },
    -- { 'git@gitlab.com:gitlab-org/editor-extensions/gitlab.vim.git',
    --     event = { 'BufReadPre', 'BufNewFile' }, -- Activate when a file is created/opened
    --     ft = { 'go', 'javascript', 'python', 'ruby' }, -- Activate when a supported filetype is open
    --     cond = function()
    --         return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= '' -- Only activate is token is present in environment variable (remove to use interactive workflow)
    --     end,
    --     opts = {
    --         statusline = {
    --         enabled = true, -- Hook into the builtin statusline to indicate the status of the GitLab Duo Code Suggestions integration
    --         },
    --     },
    -- },
    { "harrisoncramer/gitlab.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
            "nvim-tree/nvim-web-devicons" -- Recommended but not required. Icons in discussion tree.
        },
        enabled = true,
        cond = vim.env.GITLAB_TOKEN ~= nil,
        build = function () require("gitlab.server").build(true) end, -- Builds the Go binary
        config = function()
            require("gitlab").setup()
        end,
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
}
