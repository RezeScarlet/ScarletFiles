local M = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

function M.config()
  require("lualine").setup {
    options = {
      ignore_focus = { "NvimTree" },
      theme = "horizon",
    },
  }
end

return M
