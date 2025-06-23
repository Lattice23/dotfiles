return {
  -- add colorscheme
  { "ellisonleao/gruvbox.nvim" },
  { "olivercederborg/poimandres.nvim" },
  { "folke/tokyonight.nvim" },
  { "bluz71/vim-nightfly-colors" },
  { "eldritch-theme/eldritch.nvim" },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
