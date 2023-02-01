local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = "<space>"
vim.g.maplocalleader = "<space>"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "Q", "<NOP>", opts)
keymap("n", "#", "<NOP>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "#", ":b #<CR>", opts) -- overrides * backwards, but I don't use that.

-- save and source file
keymap("n", "<leader>so", ":w<CR>:so %<CR>", opts)

-- manual transfer to/from pasteboard
keymap("n", "<leader>p", ':let @"=@+<CR>', opts)
keymap("n", "<leader>y", ':let @+=@"<CR>', opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("n", "g]", "<C-]>", opts) --

-- Telescope
keymap("n", "<leader>tf", "<CMD>Telescope find_files<CR>", opts)
keymap("n", "<leader>tk", "<CMD>Telescope keymaps<CR>", opts)
keymap("n", "<leader>tw", "<CMD>Telescope grep_string<CR>", opts)
keymap("n", "<leader>th", "<CMD>Telescope history<CR>", opts)
keymap("n", "<leader>t?", "<CMD>Telescope help<CR>", opts)
keymap("n", "<leader>tl", "<CMD>Telescope tldr<CR>", opts)
keymap("n", "<leader>t'", "<CMD>Telescope marks<CR>", opts)
keymap("n", '<leader>t"', "<CMD>Telescope registers<CR>", opts)
-- nnoremap - <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>

-- TroubleToggle
keymap("n", "<leader>xx", "<CMD>TroubleToggle<CR>", opts)
keymap("n", "<leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", opts)
keymap("n", "<leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", opts)
keymap("n", "<leader>xq", "<CMD>TroubleToggle quickfix<CR>", opts)
keymap("n", "<leader>xl", "<CMD>TroubleToggle loclist<CR>", opts)
keymap("n", "gR", "<CMD>TroubleToggle lsp_references<CR>", opts)


--"Toggle between absolute -> relative line number
keymap("n", "<Leader>nn", ":let [&nu, &rnu] = [&nu, &nu+&rnu==1]<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

