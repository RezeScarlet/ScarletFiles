local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
}

local function reset_logo_hls()
-- Reference:
-- https://github.com/sei40kr/yonvim/blob/5ccd00611573a3291304666902746e7d08b53d21/lua/yvim/plugins/alpha-nvim.lua#L10
  local red = vim.g.terminal_color_1
  local pink = vim.g.terminal_color_5
  local gray = vim.api.nvim_get_hl(0, { name = "Comment" }).fg

  vim.api.nvim_set_hl(0, "ScarletNvimDashboardLogo1", { fg = red })
  vim.api.nvim_set_hl(0, "ScarletNvimDashboardLogo2", { fg = pink })
  vim.api.nvim_set_hl(0, "ScarletNvimDashboardLogo3", { fg = red, bg = pink })
  vim.api.nvim_set_hl(0, "ScarletNvimDashboardFooter", { fg = gray })
end

function M.config()
  local dashboard = require "alpha.themes.dashboard"
  local icons = require "user.icons"

  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl_shortcut = "Include"
    return b
  end

  reset_logo_hls()

  dashboard.section.header.val = {
    [[  ██████  ▄████▄   ▄▄▄       ██▀███   ██▓    ▓█████▄▄▄█████▓    ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓]],
    [[▒██    ▒ ▒██▀ ▀█  ▒████▄    ▓██ ▒ ██▒▓██▒    ▓█   ▀▓  ██▒ ▓▒    ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
    [[░ ▓██▄   ▒▓█    ▄ ▒██  ▀█▄  ▓██ ░▄█ ▒▒██░    ▒███  ▒ ▓██░ ▒░   ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░]],
    [[  ▒   ██▒▒▓▓▄ ▄██▒░██▄▄▄▄██ ▒██▀▀█▄  ▒██░    ▒▓█  ▄░ ▓██▓ ░    ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ ]],
    [[▒██████▒▒▒ ▓███▀ ░ ▓█   ▓██▒░██▓ ▒██▒░██████▒░▒████▒ ▒██▒ ░    ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒]],
    [[▒ ▒▓▒ ▒ ░░ ░▒ ▒  ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ▒░▓  ░░░ ▒░ ░ ▒ ░░      ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░]],
    [[░ ░▒  ░ ░  ░  ▒     ▒   ▒▒ ░  ░▒ ░ ▒░░ ░ ▒  ░ ░ ░  ░   ░       ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░]],
    [[░  ░  ░  ░          ░   ▒     ░░   ░   ░ ░      ░    ░            ░   ░ ░     ░░   ▒ ░░      ░   ]],
    [[      ░  ░ ░            ░  ░   ░         ░  ░   ░  ░                    ░      ░   ░         ░   ]],
    [[         ░                                                                    ░                  ]],
  }

  dashboard.section.buttons.val = {
    button("f", icons.ui.Files .. " Find file", ":Telescope find_files <CR>"),
    button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
    button("p", icons.ui.Package .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
    button("t", icons.ui.Text .. " Find text", ":Telescope live_grep <CR>"),
    button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
    button("o", icons.ui.Project .. " Obsidian Vault", ":Telescope find_files cwd=~/Documents/Vault/<CR>"),
    button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
  }
  local function footer()
    return "Scarlet Nvim"
  end

  dashboard.section.footer.val = footer()

  -- dashboard.section.header.opts.hl = "Keyword"
  dashboard.section.header.opts.hl = "ScarletNvimDashboardLogo1"
  -- dashboard.section.header.opts.hl = {
  --   { { "ScarletNvimDashboardLogo1", 0, 9999 } },
  --   { { "ScarletNvimDashboardLogo1", 6, 14 }, { "ScarletNvimDashboardLogo2", 15, 23 } },
  --   { { "ScarletNvimDashboardLogo1", 7, 9 }, { "ScarletNvimDashboardLogo3", 10, 12 }, { "ScarletNvimDashboardLogo2", 13, 18 } },
  --   { { "ScarletNvimDashboardLogo2", 0, 9999 } },
  --   { { "ScarletNvimDashboardLogo2", 0, 9999 } },
  --   {},
  --   {},
  -- }
  dashboard.section.buttons.opts.hl = "Include"
  dashboard.section.footer.opts.hl = "Type"

  dashboard.opts.opts.noautocmd = true
  require("alpha").setup(dashboard.opts)

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function()
      vim.cmd [[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
    end,
  })

end

return M
