return {
  {
    "nvimdev/dashboard-nvim",
    dependencies = {
      {
        "MaximilianLloyd/ascii.nvim",
        dependencies = {
          "MunifTanjim/nui.nvim",
        },
      },
    },
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
      local ascii = require("ascii")
      local logo = table.concat(ascii.art.misc.hydra.hydra, "\n")

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local function find_file_and_cd(dir)
        -- Default to home directory if no dir is given
        local target_dir = vim.fn.expand(dir or "~")
        require("telescope.builtin").find_files({
          cwd = target_dir,
          attach_mappings = function(prompt_bufnr, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            local open_and_cd = function()
              local entry = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              -- Open the file
              vim.cmd("edit " .. vim.fn.fnameescape(entry.path))
              -- Change directory to the file's directory
              local file_dir = vim.fn.fnamemodify(entry.path, ":h")
              vim.cmd("cd " .. vim.fn.fnameescape(file_dir))
            end
            map("i", "<CR>", open_and_cd)
            map("n", "<CR>", open_and_cd)
            return true
          end,
        })
      end

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),

          -- stylua: ignore
          center = {
            { action = function() find_file_and_cd("~") end, desc = " Find File", icon = " ", key = "f" },
            { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
            { action = "Telescope oldfiles", desc = " Recent Files", icon = " ", key = "r" },
            { action = "Telescope live_grep", desc = " Find Text", icon = " ", key = "g" },
            { action = 'lua require("telescope.builtin").find_files({ cwd = vim.fn.expand("~/.config/nvim") })', desc = " Config", icon = " ", key = "c" },
            { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
          end,
        },
      }
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#f38ba8", bold = true })
      vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "red" })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#a6e3a1", italic = true })

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },
}
