-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap 'c', 'C', 'x' and 'X' to save text in a custom register
-- avoids polluting the standard clipboard unless specifically yanked
vim.keymap.set({ "n", "v" }, "c", '"cc', { silent = true })
vim.keymap.set({ "n", "v" }, "C", '"cC', { silent = true })

vim.keymap.set({ "n", "v" }, "x", '"xx', { silent = true })


vim.keymap.set({ "n" }, "<leader>gB", ':0GBrowse<CR>', { desc = 'GBrowse' })
