local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "cpp" },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true, disable = { "kdl" } },
    sync_install = true,
  }
end

return M
