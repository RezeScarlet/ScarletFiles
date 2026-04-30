-- ~/.config/nvim/after/ftplugin/tex.lua
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Navegar visualmente nas linhas quebradas
vim.keymap.set('n', 'j', 'gj', { buffer = true })
vim.keymap.set('n', 'k', 'gk', { buffer = true })

-- Força o Neovim a usar o motor nativo de dobras por marcadores
vim.opt_local.foldmethod = "marker"

-- Define quais são os símbolos exatos que criam a dobra
vim.opt_local.foldmarker = "{{{,}}}"

-- (Opcional) Garante que o arquivo abra com as dobras abertas por padrão
-- Se preferir que abra tudo fechado, mude o 99 para 0
vim.opt_local.foldlevel = 0
