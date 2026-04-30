return {
  "saghen/blink.cmp",
  dependencies = {
    "ribru17/blink-cmp-spell",
    "rafamadriz/friendly-snippets",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
    "MeanderingProgrammer/render-markdown.nvim",
    "krissen/blink-cmp-bibtex",
  },

  version = "1.*",
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
      default = { "lsp", "omni", "spell", "path", "snippets", "buffer", "bibtex" },
      providers = {
        spell = {
          name = 'Spell',
          module = 'blink-cmp-spell',
        },
        bibtex = {
          module = "blink-cmp-bibtex",
          name = "BibTeX",
          min_keyword_length = 2,
          score_offset = 10,
          async = true,
        },
      },
    },
  }
}
