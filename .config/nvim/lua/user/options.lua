local options = {
  backup = false,                          -- creates a backup file
  shell = sh,
  completeopt = { "menuone", "noselect", "longest", "preview" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 1,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  shiftround = true,                       -- 
  softtabstop = 4,                         -- insert 4 spaces for a tab
  cursorline = true,                       -- highlight the current line
  list = true,                             -- display 'invisible' characters
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  errorbells = false,                      -- silence
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  colorcolumn = "80",                      -- 
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  guicursor="i-c-ci:ver25,o-v-ve:block,cr-sm-n-r:hor20", -- different curser by mode
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append "c" -- skip some completion messages

vim.g.netrw_browse_split = 4
vim.g.netrw_banner = 0
vim.g.netrw_liststyle=1

