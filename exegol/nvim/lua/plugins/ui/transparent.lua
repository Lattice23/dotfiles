return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup {
      enable = true,
      exclude_groups = vim.tbl_filter(
        function(group) return group:match("^lualine_") end,
        vim.fn.getcompletion("", "highlight")
      )
    }
  end,
}
