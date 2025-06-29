local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim" },
  },
}

function M.config()
  local keymap = vim.keymap.set
  local harpoon = require("harpoon")

  harpoon:setup()

  keymap("n", "<leader>hm", function() harpoon:list():add() end, {desc="Mark"})
  keymap("n", "<A-h>", function() harpoon:list():select(1) end)
  keymap("n", "<A-j>", function() harpoon:list():select(2) end)
  keymap("n", "<A-k>", function() harpoon:list():select(3) end)
  keymap("n", "<A-l>", function() harpoon:list():select(4) end)
  keymap("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc="Menu"})

end

return M
