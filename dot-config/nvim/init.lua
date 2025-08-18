require "user.launch"
require "user.options"
require "user.keymaps"
require "user.autocmds"
spec "user.colorscheme"
spec "user.alpha" -- Dashboard
spec "user.treesitter"
spec "user.mason"
spec "user.blink-cmp" -- Completion 2
spec "user.telescope"
-- spec "user.none-ls"    -- Formatter
spec "user.illuminate" -- Shows similar words
spec "user.gitsigns"   -- Git indicator on right
spec "user.whichkey"
spec "user.comment"    -- Comment line and block
spec "user.lualine"    -- Nice bar
spec "user.harpoon"
spec "user.autopairs"
spec "user.project"
spec "user.indentline"
spec "user.toggleterm"
spec "user.eyeliner"  -- F/f highlighter
spec "user.dressing"  -- Better interface windows
spec "user.ufo"       -- Toggle codeblock
spec "user.neotab"    -- Move with tab in insert mode
spec "user.colorizer" -- Colorful color codes #ff0053
spec "user.fidget"    -- Shows processes
spec "user.lazygit"
spec "user.spectre"
spec "user.todocomments"
spec "user.autosave"
-- spec "user.keys" -- Display Keys
spec "user.vim-wakatime"
spec "user.nvim-jdtls"
spec "user.satellite"
-- spec "user.nvim-conda"
spec "user.nvim-spider"
spec "user.obsidian-nvim"
spec "user.render-markdown"
spec "user.yazi"
spec "user.flutter-tools"
-- spec "user.snacks"
require "user.lazy"
