return {
  "saghen/blink.cmp",
  dependencies = {
    "ribru17/blink-cmp-spell",
    "rafamadriz/friendly-snippets",
    "saghen/blink.cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "MeanderingProgrammer/render-markdown.nvim"
  },

  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-l>"] = { "accept", "fallback" },
    },

    appearance = {
      nerd_font_variant = "Nerd Font Mono",
    },

    completion = {
      menu = { border = 'rounded' },
      accept = { auto_brackets = { enabled = true } },
      documentation = { auto_show = false },
      ghost_text = { enabled = true },
    },

    sources = {
      default = { "spell", "lsp", "path", "snippets", "buffer" },
      providers = {
        spell = {
          name = 'Spell',
          module = 'blink-cmp-spell',
          opts = {
            -- EXAMPLE: Only enable source in `@spell` captures, and disable it
            -- in `@nospell` captures.
            use_cmp_spell_sorting = true,
            enable_in_context = function()
              local curpos = vim.api.nvim_win_get_cursor(0)
              local captures = vim.treesitter.get_captures_at_pos(
                0,
                curpos[1] - 1,
                curpos[2] - 1
              )
              local in_spell_capture = false
              for _, cap in ipairs(captures) do
                if cap.capture == 'spell' then
                  in_spell_capture = true
                elseif cap.capture == 'nospell' then
                  return false
                end
              end
              return in_spell_capture
            end,
          },
        },
      },
    },
  }
}
