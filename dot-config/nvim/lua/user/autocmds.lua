-- q to close some windows
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "oil",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
    vim.opt_local.buflisted = false
  end,
})


-- Remove the command line windows from appearing by pressing q: q? q/
vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.api.nvim_command("quit")
  end,
})

-- Resize windows to fit the terminal when one is resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- Ask to reload file after changes outside nvim
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

-- Highlight text after yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

-- Activate line wrap and spell checker for the files in pattern
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})


for _, bind in ipairs({ "grn", "gra", "gri", "grr", "gw" }) do
  pcall(vim.keymap.del, "n", bind)
end

-- Options for the LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local bufnr = ev.buf
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then
      return
    end


    -- All the keymaps
    local keymap = vim.keymap.set
    local lsp = vim.lsp
    local opts = { silent = true, buffer = bufnr }
    local function opt(desc, others)
      return vim.tbl_extend("force", opts, { desc = desc }, others or {})
    end

    if client:supports_method('textDocument/formatting') then
      keymap("n", "<leader>lf", function()
        lsp.buf.format({ async = true })
      end, opt("Format file"))
    end

    keymap("n", "gd", lsp.buf.definition, opt("Go to definition"))
    keymap("n", "gi", function() lsp.buf.implementation({ border = "single" }) end, opt("Go to implementation"))
    keymap("n", "gr", lsp.buf.references, opt("Show References"))
    keymap("n", "gl", vim.diagnostic.open_float, opt("Open diagnostic in float"))
    keymap("n", "<C-k>", lsp.buf.signature_help, opts)
    keymap("n", "<Leader>la", lsp.buf.code_action, opt("Code Action"))
    keymap("n", "<Leader>lh", function() lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled({})) end,
      opt("Toggle Inlayhints"))
    keymap("n", "<Leader>li", vim.cmd.LspInfo, opt("LspInfo"))
    keymap("n", "<Leader>ll", lsp.codelens.run, opt("Run CodeLens"))
    keymap("n", "<Leader>lr", lsp.buf.rename, opt("Rename"))
    -- diagnostic mappings
    keymap("n", "<Leader>dD", function()
      local ok, diag = pcall(require, "rj.extras.workspace-diagnostic")
      if ok then
        for _, cur_client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
          diag.populate_workspace_diagnostics(cur_client, 0)
        end
        vim.notify("INFO: Diagnostic populated")
      end
    end, opt("Popluate diagnostic for the whole workspace"))
    keymap("n", "<Leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, opt("Next Diagnostic"))
    keymap("n", "<Leader>dp", function() vim.diagnostic.jump({ count = -1, float = true }) end, opt("Prev Diagnostic"))
    keymap("n", "<Leader>dq", vim.diagnostic.setloclist, opt("Diagnostic List"))
    keymap("n", "<Leader>dv", function()
      vim.diagnostic.config({ virtual_lines = not vim.diagnostic.config().virtual_lines })
    end, opt("Toggle diagnostic virtual_lines"))
    keymap("n", "<Leader>dt", function()
      vim.diagnostic.config({
        virtual_text = not vim.diagnostic.config().virtual_text,
        underline = not vim.diagnostic.config().underline,
        signs = not vim.diagnostic.config().signs

      })
    end, opt("Toggle diagnostics"))
  end,
})
