M = {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
}

function M.config()
  require("render-markdown").setup {
    heading = {
      icons = { " 󰬺 ", " 󰬻 ", " 󰬼 ", " 󰬽 ", " 󰬾 ", " 󰬿 " },
      border = true,
      border_virtual = true,
      -- position = "inline",
      -- width = "full",
      -- left_pad = 0.5,
      -- right_pad = 0.2,
    },
    checkbox = {
      customs = {},
    },
    completions = { lsp = { enabled = true } },
    render_modes = true,
    }
  
end

return M
