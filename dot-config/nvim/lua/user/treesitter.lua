local M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter").setup {
    ensure_installed = { "lua", "cpp" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true, disable = { "kdl" } },
    sync_install = true,
  }
end

return M
