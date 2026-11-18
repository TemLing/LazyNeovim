return {

  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      -- transparent_background = true,
    },
  },
{
  "ellisonleao/gruvbox.nvim",
  name = "gruvbox",
  priority = 1000,
  opts = {
    contrast = "hard",
    transparent_mode = true,

    palette_overrides = {
      dark0 = "#1d2021",
      dark1 = "#282828",
      dark2 = "#32302f",
      light0 = "#f9f5d7",

      bright_red = "#fb4934",
      bright_green = "#b8bb26",
      bright_yellow = "#fabd2f",
      bright_blue = "#83a598",
      bright_purple = "#d3869b",
      bright_aqua = "#8ec07c",
      bright_orange = "#fe8019",
    },

    overrides = {
      Normal = { bg = "#1d2021" },
      NormalFloat = { bg = "#fb4934" },
      CursorLine = { bg = "#32302f" },
      LineNr = { fg = "#665c54" },
      CursorLineNr = { fg = "#fabd2f", bold = true },
  },
},
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
}
