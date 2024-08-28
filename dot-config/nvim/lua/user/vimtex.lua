local M = {
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  init = function()
    vim.g.vimtex_view_method = "zathura"
  end
}

return M;
