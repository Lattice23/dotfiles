return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine      = require("lualine")
    local lazy_status  = require("lazy.status") -- to configure lazy pending updates count

    -- configure lualine with modified theme
    local bubbles      = require("plugins.ui.lualine-themes.bubbles")
    local evil         = require("plugins.ui.lualine-themes.evil_lualine")
    local comicink     = require("plugins.ui.lualine-themes.cosmicink")
    local slanted_gaps = require("plugins.ui.lualine-themes.slanted-gaps")
    require('lualine').setup {
      options = {
        theme = bubbles,
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
          '%=', --[[ add your center components here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end
}
