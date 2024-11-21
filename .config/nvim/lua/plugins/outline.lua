--[[ return {
  'hedyhli/outline.nvim',
  version = "*", 
  event = "VeryLazy",
  config = function()
    local actions = require('telescope.actions')
    local action_state = require('telescope.actions.state')
    local pickers = require('telescope.pickers')
    local finders = require('telescope.finders')
    local conf = require('telescope.config').values

    config = require("outline.config")
    local symbol_types = {}
    for symbol_type, _ in pairs(config.defaults.symbols.icons) do
      table.insert(symbol_types, symbol_type)
    end

    custom_options = {
      outline_window = {
        position = 'right',
        width = 40,
        relative_width = false,
      },
    }

    local outline = require("outline")
    local function outline_picker()
      pickers.new({}, {
        prompt_title = "Filter Outline Type",
        finder = finders.new_table {
          results = symbol_types,
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
          actions.select_default:replace(function()
            actions.close(prompt_bufnr)
            local selection = action_state.get_selected_entry()

            if selection and selection.value then
              local selected_value = selection.value
              outline.setup(vim.tbl_deep_extend('force', {}, custom_options, {
                symbols = {
                  filter = {selected_value}
                }
              }))
              outline.toggle_outline()
            else
              print("No selection was made or selection is nil")
            end
          end)
          return true
        end,
      }):find()
    end
    local function default_outline()
      outline.setup(vim.tbl_deep_extend('force', {}, custom_options, { symbols = { filter = nil } }))
      outline.toggle_outline()
    end
    vim.api.nvim_create_user_command('OutlineFilter', function()
      outline_picker()
    end, {})
    vim.api.nvim_create_user_command('OutlineDefault', function()
      default_outline()
    end, {})
  end,
  cmd = { "Outline", "OutlineOpen" },
  keys={
      { "<leader>Of", "<cmd>OutlineFilter<CR>", desc = "Outline filter" },
      { "<leader>Od", "<cmd>OutlineDefaults<CR>", desc = "Outline defaults" },
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  }
}
--]]

--[[
--]]
return {
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
}
--[[
--]]
