-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- -- Insert --
-- Press jk fast to exit insert mode
-- https://www.barbarianmeetscoding.com/notes/neovim-lazyvim/
vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "<ESC>" })

-- map("i", "kj", "<ESC>", { desc = "Back to normal mode" })

-- map("i", "kj", "<ESC>", opts)

-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
--
--
-- suggested by ChatGPT
-- Ref: https://chat.openai.com/share/23890c30-09bc-4303-b482-9e5f3440b289
local hop = require("hop")

vim.keymap.set("", "\\w", function()
  hop.hint_words()
end, { remap = true })

vim.keymap.set("", "\\b", function()
  hop.hint_words()
end, { remap = true })
