return {
  -- add gruvbox
  -- { "shaunsingh/solarized.nvim" },
  { "catppuccin/nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      lazy = true,
      flavour = "mocha",
    },
  },
}
