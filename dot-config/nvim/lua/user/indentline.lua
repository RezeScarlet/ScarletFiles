local M = {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
}
function M.config()
  local icons = require "user.icons"
  local highlight = {
    "RainbowLove",
    "RainbowGold",
    "RainbowPine",
    "RainbowRose",
    "RainbowIris",
    "RainbowFoam",
  }

  local hooks = require "ibl.hooks"
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowLove", { fg = "#eb6f92" })
    vim.api.nvim_set_hl(0, "RainbowGold", { fg = "#f6c177" })
    vim.api.nvim_set_hl(0, "RainbowPine", { fg = "#31748f" })
    vim.api.nvim_set_hl(0, "RainbowRose", { fg = "#ebbcba" })
    vim.api.nvim_set_hl(0, "RainbowIris", { fg = "#c4a7e7" })
    vim.api.nvim_set_hl(0, "RainbowFoam", { fg = "#9ccfd8" })
  end)
  require("ibl").setup {
    indent = {
      char = icons.ui.LineMiddle,
      highlight = highlight,
    },
    whitespace = {
      remove_blankline_trail = true,
    },
    scope = {
      enabled = true,
    },
  }

  local buftypes_to_exclude = { "terminal", "nofile", "prompt" }
  vim.api.nvim_create_autocmd("FileType", {
    pattern = table.concat(buftypes_to_exclude, ","),
    callback = function()
      vim.b.ibl_enabled = false
    end,
  })

  local filetypes_to_exclude = {
    "help",
    "startify",
    "dashboard",
    "lazy",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "text",
    "kdl",
    "markdown",
    "gitcommit",
    "lua",
  }
  vim.api.nvim_create_autocmd("FileType", {
    pattern = table.concat(filetypes_to_exclude, ","),
    callback = function()
      vim.b.ibl_enabled = false
    end,
  })
end

return M
