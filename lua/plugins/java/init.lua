return {
  "nvim-java/nvim-java",
  event = { "BufEnter *.java" },

  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "MunifTanjim/nui.nvim",
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
    --{
    --"williamboman/mason-lspconfig.nvim",
    --opts = {
    ----handlers = {
    ----["jdtls"] = function()
    ----require("java").setup()
    ----end,
    ----},
    --notifications = {
    --dap = true,
    --},
    --},
    --},
  },
  -- load java test plugins
  java_test = {
    enable = true,
  },
  -- load java debugger plugins
  java_debug_adapter = {
    enable = true,
  },
  notifications = {
    -- enable 'Configuring DAP' & 'DAP configured' messages on start up
    dap = true,
  },
  config = function()
    require("java").setup()
    require("lspconfig").jdtls.setup({})
  end,
}
