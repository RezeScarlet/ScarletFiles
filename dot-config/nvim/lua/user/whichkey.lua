local M = {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.nvim",
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  local mappings = {
    { "<leader>f", group = "Telescope" },
    { "<leader>h", group = "Harpoon" },
    { "<leader>l", group = "LSP" },
    { "<leader>g", group = "Git" },
    { "<leader>d", group = "Diagnostics" },
  }
  local which_key = require "which-key"
  local opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = false,
        nav = false,
        z = true,
        g = true,
      },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    layout = {
      align = "center",
    },
    win = {
      border = "rounded",
      position = "bottom",
      padding = { 2, 2, 2, 2 },
    },
    ignore_missing = true,
    show_help = true,
    show_keys = false,
    disable = {
      ft = { "TelescopePrompt" },
      bt = {},
    },
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
  }

  which_key.add(mappings, opts)
end

return M
