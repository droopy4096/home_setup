return {
  "fgheng/winbar.nvim",
  config = function()
    require("winbar").setup({
      enabled = true,
      show_file_path = true,
      colors = {
        path = "#191919",
        filename = "#a98960",
      },
      exclude_filetype = {
        "neo-tree",
        "help",
        "startify",
        "dashboard",
        "packer",
        "neogitstatus",
        "NvimTree",
        "Trouble",
        "alpha",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "qf",
      },
    })
  end,
}
-- Winbar is already pre-installed with LazyVim
-- return {}

