M = {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  event = {
    "BufReadPre /home/rezescarlet/Documents/Vault/*.md",
    "BufNewFile /home/rezescarlet/Documents/Vault/*.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Vault",
        path = "/home/rezescarlet/Documents/Vault/",
      },
    },

    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },

    new_notes_location = "current_dir",

    preferred_link_style = "wiki",

    disable_frontmatter = true,
    ui = {
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
      },
    },
  },
}


return M
