return {
  "mfussenegger/nvim-lint",
  optional = true,
  opts = {
    linters = {
      ["markdownlint-cli2"] = {
        args = { "--config", "/home/lattice/.config/nvim/lua/plugins/markdownlint-cli2.yaml", "--" },
      },
    },
  },
}
