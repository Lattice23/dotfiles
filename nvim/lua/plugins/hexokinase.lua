return {
  "rrethy/vim-hexokinase",
  build = "make hexokinase",
  init = function()
    vim.g.Hexokinase_highlighters = { "virtual" } -- Or any other you prefer
    vim.g.Hexokinase_optInPatterns = {
      "full_hex",
      "rgb",
      "rgba",
      "hsl",
      "hsla",
      "colour_names",
    }
    vim.opt.termguicolors = true
  end,
}
