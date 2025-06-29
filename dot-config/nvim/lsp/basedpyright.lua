return {
  name = "basedpyright",
  filetypes = { "python" },
  cmd = { "basedpyright-langserver", "--stdio" },
  root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "pyrightconfig.json", ".git" },
  settings = {
    -- python = {
      -- pythonPath = "/home/rezescarlet/.conda/envs/Blurry-Ness/bin/python",
      -- venvPath = "/home/rezescarlet/.conda/envs",
      -- venv = "Blurry-Ness",
    -- },
    basedpyright = {
      disableOrganizeImports = true,
      analysis = {
        autoSearchPaths = true,
        autoImportCompletions = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "strict",
        inlayHints = {
          variableTypes = true,
          callArgumentNames = true,
          functionReturnTypes = true,
          genericTypes = false,
        },
      },
    },
  },
}
