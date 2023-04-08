return {
  {
    'phaazon/hop.nvim',
    branch = "v2", -- optional but strongly recommended
   -- cmd = function()
   --   -- you can configure Hop the way you like here; see :h hop-config
   --   require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
   -- end,
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },
}
