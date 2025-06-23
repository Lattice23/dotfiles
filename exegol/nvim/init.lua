-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- In your init.lua or init.vim
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"

-- Ensure cursor is restored on exit
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  command = "set guicursor=a:ver25",
})

-- function Transparent(color)
--   color = color or "tokyonight-storm"
--   vim.cmd.colorscheme(color)
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
-- Transparent()
