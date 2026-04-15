-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Spell checking keymaps
vim.keymap.set("n", "z=", "z=", { noremap = true, silent = true })
vim.keymap.set("n", "zg", "zg", { noremap = true, silent = true, desc = "Add word to spell list" })
vim.keymap.set("n", "zw", "zw", { noremap = true, silent = true, desc = "Mark word as wrong" })
vim.keymap.set("n", "zu", "zu", { noremap = true, silent = true, desc = "Undo last spell command" })
