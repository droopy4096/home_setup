return {
  'nvim-treesitter/nvim-treesitter-context',
  enabled = true,
  config = function ()
    require('treesitter-context').setup {
      enable = false,
      multiline_threshold=3,
      separator='-',
    }
  end
}
