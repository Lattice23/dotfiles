return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers", -- show open buffers, not tabs
      separator_style = "slant",
      diagnostics = "nvim_lsp",
    },
  },
}
