 return {
  "fgheng/winbar.nvim",
  config = function()
    require('winbar').setup({
      show_file_path=false,
      exclude_filetype = {
        'neo-tree',
        'help',
        'startify',
        'dashboard',
        'packer',
        'neogitstatus',
        'NvimTree',
        'Trouble',
        'alpha',
        'lir',
        'Outline',
        'spectre_panel',
        'toggleterm',
        'qf',
       }
    })
  end,
}
-- Winbar is already pre-installed with LazyVim
--return {}

