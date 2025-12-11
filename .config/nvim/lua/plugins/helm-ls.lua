return {
  {
		"qvalentin/helm-ls.nvim",
		ft = "helm",
		opts = {
			conceal_templates = {
				-- enable the replacement of templates with virtual text of their current values
				enabled = true, -- tree-sitter must be setup for this feature
			},
			indent_hints = {
				-- enable hints for indent and nindent functions
				enabled = true, -- tree-sitter must be setup for this feature
			},
		},
    config = function()
      local lspconfig = vim.lsp.config
      vim.lsp.enable("helm_ls")
      -- setup helm-ls
      lspconfig("helm_ls", {
        settings = {
          ["helm-ls"] = {
            yamlls = {
              path = "yaml-language-server",
            },
          },
        },
      })
    end
  },
}
