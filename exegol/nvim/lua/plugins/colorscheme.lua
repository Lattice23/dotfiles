return {
  -- add colorscheme
  { "ellisonleao/gruvbox.nvim" },
  { "olivercederborg/poimandres.nvim" },
  { "folke/tokyonight.nvim" },
  { "bluz71/vim-nightfly-colors" },
  { "eldritch-theme/eldritch.nvim" },

  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("eldritch").setup({
        transparent = true,
        palette = "default",
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "transparent",
          floats = "transparent",
        },
        sidebars = { "qf", "help" },
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = true,
      })
    end,
  },
  -- Configure LazyVim to load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "eldritch",
    },
  },
}
