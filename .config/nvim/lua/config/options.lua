-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Custom filetype detection
vim.filetype.add({
  extension = {
    mustache = "glimmer",
  },
})

-- Firenvim configuration
vim.g.firenvim_config = {
  globalSettings = { alt = "all" },
  localSettings = {
    [".*"] = {
      cmdline = "neovim",
      content = "text",
      priority = 0,
      selector = "textarea",
      takeover = "always",
    },
    ["https://www.google.com/search"] = {
      priority = 1,
      takeover = "never",
    },
  },
}

-- Disable autoformatting by default
vim.g.autoformat = false
