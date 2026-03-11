-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap 'c', 'C', 'x' and 'X' to save text in a custom register
-- avoids polluting the standard clipboard unless specifically yanked
vim.keymap.set({ "n", "v" }, "c", '"cc', { silent = true })
vim.keymap.set({ "n", "v" }, "C", '"cC', { silent = true })
vim.keymap.set({ "n", "v" }, "x", '"xx', { silent = true })

-- Git browsing using Snacks
vim.keymap.set("n", "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })

-- Register Moodle prefix
require("which-key").add({
  { "<leader>m", group = "Moodle", icon = "󰐗" },
  { "<leader>h", group = "DevDocs", icon = "󰗚" },
})

local function get_moodle_root()
  local path = vim.fn.expand("%:p:h")
  if path == "" then
    path = vim.fn.getcwd()
  end
  -- Moodle root has config-dist.php
  local root_file = vim.fs.find("config-dist.php", {
    path = path,
    upward = true,
    stop = vim.uv.os_homedir(),
  })[1]

  return root_file and vim.fs.dirname(root_file) or vim.fn.expand("~/github/moodle45")
end

-- Projects
vim.keymap.set("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })

-- Find in Moodle
vim.keymap.set("n", "<leader>mf", function()
  local root = get_moodle_root()
  Snacks.picker.files({ cwd = root, title = "Find Moodle (" .. root .. ")" })
end, { desc = "Find in Moodle" })

-- Grep in Moodle
vim.keymap.set("n", "<leader>mg", function()
  local root = get_moodle_root()
  Snacks.picker.grep({ cwd = root, title = "Grep Moodle (" .. root .. ")" })
end, { desc = "Grep in Moodle" })
