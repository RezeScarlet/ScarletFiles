local M = {
  "folke/which-key.nvim",
  dependencies = {
    "echasnovski/mini.nvim",
  },
}

function M.config()
  local mappings = {
    { "<leader>;", "<cmd>Alpha<CR>", desc = "DashBoard" },
    { "<leader>G", "<cmd>LazyGit<CR>", desc = "Lazygit" },
    { "<leader>L", "<cmd>Lazy<CR>", desc = "Plugins" },
    { "<leader>S", "<cmd>Spectre<CR>", desc = "Search and Replace" },
    { "<leader>T", "<cmd>TransparentToggle<CR>", desc = "Transparency" },
    { "<leader>f", group = "Find" },
    { "<leader>l", group = "LSP" },
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
    { "<leader>s", "<cmd>ASToggle<CR>", desc = "Toggle Auto Save" },
    { "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Terminal" },
    { "<leader>v", "<cmd>vsplit<CR>", desc = "Split" },
    { "<leader>w", "<cmd>confirm w<CR>", desc = "Save" },
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
      ft= { "TelescopePrompt" },
      bt= {},
    },
    mode = "n", -- NORMAL mode
    prefix = "<leader>",

  }

  which_key.add(mappings, opts)
end

return M
