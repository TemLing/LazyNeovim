return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      enabled = true,
      render_modes = { "n", "c", "t" },
      -- render_modes = true,
      heading = {
        enabled = true,
      },
      code = {
        enabled = true,
        sign = false,
        width = "full",
      },
      bullet = {
        enabled = true,
      },
      checkbox = {
        enabled = true,
      },
      pipe_table = {
        enabled = true,
      },
    },
  },
}
