 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#fffaf3',
    base01 = '#f2e9e1',
    base02 = '#ecdfd3',
    base03 = '#959190',
    base04 = '#797593',
    base05 = '#575279',
    base06 = '#575279',
    base07 = '#575279',
    base08 = '#b56364',
    base09 = '#d7827e',
    base0A = '#907aa9',
    base0B = '#b4637a',
    base0C = '#7e1f1b',
    base0D = '#7e1b37',
    base0E = '#491b7e',
    base0F = '#611fad',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#575279',          bg = '#fffaf3' })
  hi('TelescopeBorder',         { fg = '#959190',             bg = '#fffaf3' })
  hi('TelescopePromptNormal',   { fg = '#575279',          bg = '#fffaf3' })
  hi('TelescopePromptBorder',   { fg = '#959190',             bg = '#fffaf3' })
  hi('TelescopePromptPrefix',   { fg = '#b4637a',             bg = '#fffaf3' })
  hi('TelescopePromptCounter',  { fg = '#797593',  bg = '#fffaf3' })
  hi('TelescopePromptTitle',    { fg = '#fffaf3',             bg = '#b4637a' })
  hi('TelescopePreviewTitle',   { fg = '#fffaf3',             bg = '#907aa9' })
  hi('TelescopeResultsTitle',   { fg = '#fffaf3',             bg = '#d7827e' })
  hi('TelescopeSelection',      { fg = '#575279',          bg = '#ecdfd3' })
  hi('TelescopeSelectionCaret', { fg = '#b4637a',             bg = '#ecdfd3' })
  hi('TelescopeMatching',       { fg = '#b4637a',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#575279',          bg = '#fffaf3' })
  hi('MiniPickBorder',         { fg = '#959190',             bg = '#fffaf3' })
  hi('MiniPickPrompt',   { fg = '#575279',          bg = '#fffaf3' })
  hi('MiniPickPromptPrefix',   { fg = '#b4637a',             bg = '#fffaf3' })
  hi('MiniPickBorderText',    { fg = '#fffaf3',             bg = '#b4637a' })
  hi('MiniPickMatchCurrent',      { fg = '#575279',          bg = '#ecdfd3' })
  hi('MiniPickPromptCaret', { fg = '#b4637a',             bg = '#ecdfd3' })
  hi('MiniPickMatchRanges',       { fg = '#b4637a',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
