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
      "README.md",
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    jdk = {
      auto_install = true,
      version = "23.0.2",
    },
  }

  require("lspconfig").jdtls.setup {
    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "java-23-openjdk",
              path = "/usr/lib/jvm/java-23-openjdk/",
              default = true,
            },
          },
        },
        project = {
          sourcePaths = { "src" },
          outputPath = "bin",
          referencedLibraries = {
            "lib/**/*.jar",
          },
          referencedSources = {
            ["lib/JSGE-v1.6.1-bin.jar"] = "lib/JSGE-v1.6.1-src.jar",
          },
        },
      },
    },
    init_options = {
      vmargs = {
        "-Djava.library.path=lib/jinput-2.0.10-natives-all",
      },
    },
  }
end
return M
