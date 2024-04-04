return {
  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
        require("java").setup()
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
        jdtls = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          vim.cmd("nvm use default 18")
          require("typescript").setup({
            server = {
              cmd = opts,
            },
          })
          return true
        end,
        jdtls = function(_, opts)
          require("jdtls").setup({
            server = {
              cmd = opts,
            },
          })
        end,
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- add mason
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "gopls",
        --  JS / TS
        "eslint-lsp",
        "typescript-language-server",
        "prettier",

        -- Rust
        "rust-analyzer",
        -- Python
        "black",
        "pyright",
        -- Java
        "jdtls",
      },
    },
  },
}
