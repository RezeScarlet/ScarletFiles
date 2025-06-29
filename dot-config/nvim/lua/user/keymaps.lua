local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move line
keymap("n", "<D-j>", ":m .+1<CR>==", opts)
keymap("n", "<D-k>", ":m .-2<CR>==", opts)

-- Move block
-- D for Meta key
keymap("v", "<D-j>", ":m '>+1<CR>gv-gv")
keymap("v", "<D-k>", ":m '<-2<CR>gv-gv")

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

keymap("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
--
-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)
keymap("t", "<C-;>", "<C-\\><C-n>", opts)

-- Former keymaps defined by which-key
keymap("n", "<leader>;", "<cmd>Alpha<CR>", { desc = "Alpha" })
keymap("n", "<leader>G", "<cmd>LazyGit<CR>", { desc = "Lazygit" })
keymap("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "Lazy.nvim" })
keymap("n", "<leader>S", "<cmd>Spectre<CR>", { desc = "Spectre" })
keymap("n", "<leader>w", "<cmd>confirm w<CR>", { desc = "Save" })
keymap("n", "<leader>q", "<cmd>confirm q<CR>", { desc = "Quit" })
keymap("n", "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Terminal" })

keymap("n", "<leader>y", "<cmd>%y<CR>", {desc = "Yank File"})
keymap("n", "<leader>s", "<cmd>vs<CR>", {desc = "Vertical Split"})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local autocmd_Opts = { noremap = true, silent = true, buffer = true }

    keymap("v", "<leader>i", 'c*<C-r><C-o>"*<Esc>', {desc = "Italic"}, autocmd_Opts)
    keymap("v", "<leader>b", 'c**<C-r><C-o>"**<Esc>',{desc = "Bold"}, autocmd_Opts)
    keymap("v", "<leader>s", 'c~~<C-r><C-o>"~~<Esc>',{desc = "Strikethrough"}, autocmd_Opts)

  end,
})
