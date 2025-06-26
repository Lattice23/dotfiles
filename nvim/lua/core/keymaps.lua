vim.g.mapleader = " "

local keymap = vim.keymap

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>pv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>pg", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>pe", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>px", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>to", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab


-- ui
keymap.set("n", "<leader>u", "<cmd>Huez<CR>", { desc = "colorscheme selection" })
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy" })
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer


-- moves lines
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })
keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv", { silent = true })

-- buffers
keymap.set("n", "<TAB>", ":bn<CR>")
keymap.set("n", "<S-TAB>", ":bp<CR>")

keymap.set("n", "<leader>bx", ":bdelete<CR>", { desc = "Close current buffer", silent = true })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer", silent = true })

keymap.set("n", "H", ":bprevious<CR>", { desc = "Previous buffer", silent = true })
keymap.set("n", "L", ":bnext<CR>", { desc = "Next buffer", silent = true })

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })

-- obsidian
keymap.set("n", "<leader>on", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Edit note from obsidian vault" })
keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>", { desc = "Open obsidian application" })
keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<CR>", { desc = "View obsidian tags" })
keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "View current buffer obsidian links" })
keymap.set("n", "<leader>oT", "<cmd>ObsidianNewFromTemplate<CR>", { desc = "Create new note from template" })
keymap.set("n", "<leader>oc", "<cmd>ObsidianTOC<CR>", { desc = "Display Table of Contents" })



-- terminal
keymap.set("n", "<C-_>", function()
  vim.cmd("botright split | terminal")
end, { desc = "Open terminal in horizontal split", silent = true })

keymap.set("n", "<leader>_", function()
  vim.cmd("botright split | terminal")
end, { desc = "Open terminal in horizontal split", silent = true })

keymap.set("n", "<leader>|", function()
  vim.cmd("vsplit | terminal")
end, { desc = "Open terminal in vertical split", silent = true })

-- lsp
local opts = { silent = true }

opts.desc = "Show LSP references"
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

opts.desc = "Go to declaration"
keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

opts.desc = "Show LSP definitions"
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

opts.desc = "Show LSP implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

opts.desc = "Show LSP type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

opts.desc = "See available code actions"
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

opts.desc = "Smart rename"
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

opts.desc = "Show buffer diagnostics"
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

opts.desc = "Show line diagnostics"
keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

opts.desc = "Show documentation for what is under cursor"
keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

opts.desc = "Restart LSP"
keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
