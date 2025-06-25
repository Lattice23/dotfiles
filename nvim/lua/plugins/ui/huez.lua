return {
    "vague2k/huez.nvim",
    -- if you want registry related features, uncomment this
    -- import = "huez-manager.import"
    branch = "stable",
    event = "UIEnter",
    config = function()
        require("huez").setup({
        path = vim.fs.normalize(vim.fn.stdpath("data") --[[@as string]]) .. "/huez",
        fallback = "default",
        suppress_messages = true,
        theme_config_module = nil,
        exclude = { "desert", "evening", "industry", "koehler", "morning", "murphy", "pablo", "peachpuff", "ron", "shine", "slate", "torte", "zellner", "blue", "darkblue", "delek", "quiet", "elflord", "habamax", "lunaperche", "zaibatsu", "wildcharm", "sorbet", "vim", },
        background = "dark",
        picker = {
          themes = {
            layout = "right",
            opts = {},
          },
          favorites = {
            layout = "right",
            opts = {},
          },
          live = {
            layout = "right",
            opts = {},
          },
          ensured = {
            layout = "right",
            opts = {},
          },
        },
      })
  end,
}
