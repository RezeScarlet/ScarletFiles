local M = {
  "rose-pine/neovim",
  as = "rose-pine",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  require("rose-pine").setup({
    styles = {
      transparency = true,    },
  })

  vim.cmd.colorscheme "rose-pine"
end

return M
