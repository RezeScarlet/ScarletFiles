local M = {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = "tectonic"
    vim.g.vimtex_fold_enabled = 1
    vim.g.vimtex_fold_types = { preamble = { enabled = true } }
  end,
}
return M
