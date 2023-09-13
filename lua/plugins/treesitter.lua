return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- ignore it because it will report error every time we opne neovim
    -- https://github.com/LazyVim/LazyVim/issues/524#issuecomment-1493417966
    opts.ignore_install = { "help" }

    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end
  end,
}
