return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "jdtls",
        "clangd",
        "debugpy",
        "codelldb",
        "java-debug-adapter",
        "java-test",
      },
    },
  },
}
