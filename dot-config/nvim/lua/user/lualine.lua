local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  require("lualine").setup {
    options = {
      ignore_focus = { "NvimTree", "Yazi", "Telescope" },
      theme = "horizon",
      section_separators = { left = "", right = "" },
      component_separators = { left = '', right = '' },
    },

    sections = {
      lualine_a = {
        { "mode", separator = { left = "", right = " " }, icon = "" },
      },
      lualine_b = {
        {
          "filetype",
          icon_only = true,
          padding = { left = 1, right = 0 },
        },
        "filename",
      },
      lualine_c = {
        {
          "branch",
          icon = "",
        },
        {
          "diff",
          symbols = { added = " ", modified = " ", removed = " " },
          colored = false,
        },
      },
      lualine_x = {
        "g:obsidian",
        {
          "diagnostics",
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
          update_in_insert = true,
        },
      },
      lualine_y = {
        {
          "filetype",
          icon_only = true,
          separator = nil,
        },
        "lsp_status" },
      lualine_z = {
        { "progress", separator = { left = "", right = "" } },
      },
    },
  }
end

return M
