vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true


-- Tabs & indention
opt.tabstop = 2      -- 2 spaces for tab
opt.shiftwidth = 2   -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when staring new one 

opt.wrap = true


-- Search settings
opt.ignorecase = true -- ignore case
opt.smartcase = true  -- Assume case-sensitive if mixing cases

opt.cursorline = true


-- Termgui colors
opt.termguicolors = true
opt.background = "dark" -- prefer dark theme
opt.signcolumn  = "yes"  -- show sign column so text doesnt shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, and insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard

-- split windows
opt.splitright = true -- split vertical
opt.splitright = true -- split horizontal

