local M = {
  "nvim-java/nvim-java",
  lazy = false,
}
-- require('java').setup()
require("lspconfig").jdtls.setup {
  cmd = { "jdtls", "-data", '~/Desktop/Computer-Science/Data Structures/ProjetoESDArvores-master/' },
  settings = {
    java = {
      project = {
        referencedLibraries = {
          "lib/JSGE-v1.1.0/jsge.jar", -- substitua pelo caminho correto do arquivo .jar
        },
      },
    },
  },
}
return M
