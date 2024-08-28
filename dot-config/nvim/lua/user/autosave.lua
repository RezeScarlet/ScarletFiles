local M = {
  "0x00-ketsu/autosave.nvim",
  event = { "InsertLeave", "TextChanged" },
}

function M.config()
  require("autosave").setup {}
end

return M
