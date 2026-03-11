-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Open help in a vertical split to the right
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  callback = function()
    vim.cmd("wincmd L")
    vim.cmd("vert resize 83")
  end,
})

-- Ghost user autocommands for browser editing
local ghost_group = vim.api.nvim_create_augroup("nvim_ghost_user_autocommands", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = ghost_group,
  pattern = { "www.reddit.com", "www.stackoverflow.com", "www.github.com", "*github.com" },
  callback = function()
    vim.bo.filetype = "markdown"
  end,
})
