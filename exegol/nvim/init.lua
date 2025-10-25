require("core")
require("boot-lazy")

-- markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 2
  end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- function Transparent(color)
--   color = color or "eldritch"
--   vim.cmd.colorscheme(color)
--   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end
--
-- Transparent()

-- Create an autocommand group for toggling relative numbers
vim.api.nvim_create_augroup("cmd_line_relnum_toggle", { clear = true })

-- Disable relative numbers when entering command line mode
vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = "cmd_line_relnum_toggle",
  callback = function()
    vim.wo.relativenumber = false
    vim.cmd [[ redraw ]]
  end,
})

-- Re-enable relative numbers when leaving command line mode
vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = "cmd_line_relnum_toggle",
  callback = function()
    vim.wo.relativenumber = true
  end,
})

-- diagnostics
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.HINT]  = "󰠠 ",
      [vim.diagnostic.severity.INFO]  = " ",
    },
  },
})
