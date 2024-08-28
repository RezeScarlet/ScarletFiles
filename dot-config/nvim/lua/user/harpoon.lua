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

  keymap("n", "<C-m>", function() harpoon:list():add() end)
  keymap("n", "<C-1>", function() harpoon:list():select(1) end)
  keymap("n", "<C-2>", function() harpoon:list():select(2) end)
  keymap("n", "<C-3>", function() harpoon:list():select(3) end)
  keymap("n", "<C-4>", function() harpoon:list():select(4) end)
  keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

  -- local conf = require("telescope.config").values
  -- local function toggle_telescope(harpoon_files)
  --     local file_paths = {}
  --     for _, item in ipairs(harpoon_files.items) do
  --         table.insert(file_paths, item.value)
  --     end
  --
  --     require("telescope.pickers").new({}, {
  --         prompt_title = "Harpoon",
  --         finder = require("telescope.finders").new_table({
  --             results = file_paths,
  --         }),
  --         previewer = conf.file_previewer({}),
  --         sorter = conf.generic_sorter({}),
  --     }):find()
  -- end
  --
  -- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
  --     { desc = "Open harpoon window" })
end

return M
