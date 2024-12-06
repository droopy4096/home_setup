return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",

      highlight_overrides = {
        all = function(C)
          return {
            -- fix visual selection within illuminated words not visible enough
            IlluminatedWordText = { bg = C.surface1 },
            IlluminatedWordRead = { bg = C.surface1 },
            IlluminatedWordWrite = { bg = C.surface1 },
            Visual = { bg = C.surface0, style = { "bold" } },
          }
        end,
      },
    },
  },
}
