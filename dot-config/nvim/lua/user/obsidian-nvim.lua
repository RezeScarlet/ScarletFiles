return {
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
  ---@module 'obsidian'
  ---@type obsidian.config.ClientOpts
  opts = {
    workspaces = {
      {
        name = "Vault",
        path = "/home/rezescarlet/Documents/Vault/",
      },
    },

    completion = {
      nvim_cmp = true,
      blink = false,
      min_chars = 2,
    },

    new_notes_location = "current_dir",

    -- Either 'wiki' or 'markdown'.
    preferred_link_style = "wiki",

    -- Optional, boolean or a function that takes a filename and returns a boolean.
    -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
    disable_frontmatter = true,
  },
}
