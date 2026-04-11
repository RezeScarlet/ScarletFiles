-- ~/.config/nvim/after/ftplugin/tex.lua
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Navegar visualmente nas linhas quebradas
vim.keymap.set('n', 'j', 'gj', { buffer = true })
vim.keymap.set('n', 'k', 'gk', { buffer = true })
