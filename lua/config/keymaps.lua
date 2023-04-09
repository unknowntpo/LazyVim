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
local hop = require("hop")
local directions = require("hop.hint").HintDirection
-- vim.keymap.set("", "f", function()
-- hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
-- end, { remap = true })

vim.keymap.set("", "\\f", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })

vim.keymap.set("", "\\b", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true })
