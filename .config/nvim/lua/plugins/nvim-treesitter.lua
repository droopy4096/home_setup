return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "go",
          "gomod",
          "gowork",
          "gosum",
          "ruby",
          "ninja",
          "python",
          "rst",
          "toml",
          "yaml",
          "bash",
          "hcl",
          "terraform",
          "yaml",
          "helm",
        })
      end
    end,
  },
}
