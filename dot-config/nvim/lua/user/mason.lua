local M = {
    "williamboman/mason.nvim",
  -- "williamboman/mason-lspconfig.nvim",
  -- dependencies = {
  -- },
}

function M.config()
  local servers = {
    "lua_ls",
    "clangd",
  }

  require("mason").setup {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
      border = "rounded"
    },
  }

  -- require("mason-lspconfig").setup {
  --   ensure_installed = servers,
  --   opts = {
  --     auto_install = true,
  --   },
  -- }
end

return M
