local M = {
  "nvim-java/nvim-java",
  lazy = false,
}

jdtls = function()
  require("java").setup() {
    root_markers = {
      "settings.gradle",
      "settings.gradle.kts",
      "pom.xml",
      "build.gradle",
      "mvnw",
      "gradlew",
      "build.gradle",
      "build.gradle.kts",
      ".git",
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    }
  }

  require("lspconfig").jdtls.setup {
    cmd = { "jdtls", "-data", "/home/rezescarlet/Desktop/Non-Linear-Structures/" },
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
end
return M
