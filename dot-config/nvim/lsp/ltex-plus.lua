local spell_file = vim.fn.expand("~/.config/nvim/spell/pt.utf-8.add")
local my_words = vim.fn.filereadable(spell_file) == 1 and vim.fn.readfile(spell_file) or {}

for i, word in ipairs(my_words) do my_words[i] = word:match("^([^/]+)") end

local language_id_mapping = {
  bib = 'bibtex',
  pandoc = 'markdown',
  plaintex = 'tex',
  rnoweb = 'rsweave',
  rst = 'restructuredtext',
  tex = 'latex',
  text = 'plaintext',
}

return {
  cmd = { 'ltex-ls-plus' },
  filetypes = {
    'asciidoc',
    'bib',
    'context',
    'gitcommit',
    'html',
    'markdown',
    'org',
    'pandoc',
    'plaintex',
    'quarto',
    'mail',
    'mdx',
    'rmd',
    'rnoweb',
    'rst',
    'tex',
    'text',
    'typst',
    'xhtml',
  },
  root_markers = { '.git' },
  get_language_id = function(_, filetype)
    return language_id_mapping[filetype] or filetype
  end,
  settings = {
    ltex = {
      language = "pt-BR",
      additionalRules = {
        enablePickyRules = true,
      },
      dictionary = {
        ["pt-BR"] = my_words,
      },
      enabled = {
        'asciidoc',
        'bib',
        'context',
        'gitcommit',
        'html',
        'markdown',
        'org',
        'pandoc',
        'plaintex',
        'quarto',
        'mail',
        'mdx',
        'rmd',
        'rnoweb',
        'rst',
        'tex',
        'latex',
        'text',
        'typst',
        'xhtml',
      },
    },
  },
}
