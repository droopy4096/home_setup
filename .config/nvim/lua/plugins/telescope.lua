local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<c-d>"] = actions.delete_buffer
          },
          n = {
            ["<c-d>"] = actions.delete_buffer,
            ["dd"] = actions.delete_buffer,
          }
        },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.55,
            results_width = 0.8,
          },
        },
        sorting_strategy = "ascending",
        winblend = 0,
        -- vimgrep_arguments = {
        --   'rg',
        --   '--color=never',
        --   '--no-heading',
        --   '--with-filename',
        --   '--line-number',
        --   '--column',
        --   '--smart-case',
        --   '--hidden' -- thats the new thing
        -- },
        vimgrep_arguments = {
          "ag",
          "--nocolor",
          "--no-heading",
          "--filename",
          "--numbers",
          "--column",
          "--smart-case",
          "--hidden",
          "--ignore=.git/",
        },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      },
    },
  },
}
