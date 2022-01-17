if &shell =~# 'fish$'
    set shell=sh
endif

lua require("plugins")
"lua require("options")
"lua require("mappings")

" General setttings

" Sets
colorscheme unreadable

" Keep buffers with unsaved changes around
set hidden

set noshowmode

set softtabstop=4
set shiftwidth=4
set expandtab
" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround
set nowrap
set termguicolors
set signcolumn=yes

if !&scrolloff
        set scrolloff=8     " Show next 8 lines while scrolling.
endif
if !&sidescrolloff
        set sidescrolloff=5 " Show next 5 columns while side-scrolling.
endif

set nostartofline           " Do not jump to first character with page commands.
set noerrorbells            " No beeps
set ignorecase smartcase
set undofile " persistant undo beyond session

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" subtle vertical line to check alignment
set cursorcolumn

" subtle vertical line to limit long lines
set colorcolumn=80

" number for current line, relativeline elsewhere
" Plug 'jeffkreeftmeijer/vim-numbertoggle' does other tweaks to this
" based on mode
set number relativenumber

" Make annoying invisible characters slightly visible.
set list

" Lets
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" Remaps
nnoremap <Leader>so :w<CR>:so %<CR>

nnoremap q: <nop>
nnoremap Q <nop>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" paste from system clipboard
" mnemonic, you've just y'd, oops, <leader>y to fix
nnoremap <leader>y :let @"=@+<cr>
" mnemonic, you've just p'd, oops, <leader>p to fix
nnoremap <leader>p :let @+=@"<cr>
" delete and send to black hole, don't update yank buffer
"  this takes too much thinking ahead, just use registers to access the
"  previous thing, or the remaps above to swich between registers.
"nnoremap <leader>d "_d
"vnoremap <leader>d "_d

" Sync
lua << EOF
require('telescope').setup{
 extensions = {
  },
    defaults = {
      border = true,
      borderchars = {
        prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
        results = { " ", " ", " ", " ", " ", " ", " ", " " },
        preview = { " ", " ", " ", "⎸", " ", " ", " ", " " },
        },
        layout_config = {
            horizontal = { width = 0.9999, height = 0.9999 },
        }
    }
}

EOF

" Find files using Telescope command-line sugar.
" find in current, find files in cwd, find files anywhere
nnoremap <leader>tf <cmd>Telescope find_files<cr>
" tp find files in project
nnoremap <leader>tk <cmd>Telescope keymaps<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>tw <cmd>Telescope grep_string<cr>
nnoremap <leader>th <cmd>Telescope history<cr>
nnoremap <leader>t? <cmd>Telescope help_tags<cr>
nnoremap <leader>tl <cmd>Telescope tldr<cr>
nnoremap <leader>tr <cmd>lua require'telescope'.extensions.repo.list{cwd='~/ghq/',fd_opts={'-td','--prune','--max-depth=5','--ignore=~/.config/ghqfdignore'}}<cr>
nnoremap <leader>t' <cmd>Telescope marks<cr>
nnoremap <leader>t" <cmd>Telescope registers<cr>

" copy vim-vinegar hotkey, still need to go up one
nnoremap - <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<cr>

lua << EOF

-- express line statusline
require('el').setup()

 local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'neorg' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline' }
    })
  })

  --
EOF

augroup MYSTUFF
        autocmd!
        " open all splits verticall
        autocmd WinNew * wincmd L
        " briefly higlight yanked text
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 400})
        autocmd FileType css,scss setlocal iskeyword+=-
        autocmd FileType scss setlocal iskeyword+=@-@
augroup END
augroup neovim_terminal
    autocmd!
    " Enter Terminal-mode (insert) automatically
    autocmd TermOpen * startinsert
    " Disables number lines on terminal buffers
    autocmd TermOpen * :set nonumber norelativenumber
    " allows you to use Ctrl-c on terminal window
    autocmd TermOpen * nnoremap <buffer> <C-c> i<C-c>
augroup END

" vertical line for instert,underline for normal, block for visual
set guicursor=i-c-ci:ver25,o-v-ve:block,cr-sm-n-r:hor20

" indent without kill the selection in vmode
vmap < <gv
vmap > >gv

" remap the annoying u in visual mode
vmap u y

" Disable anoying ex mode
nnoremap Q <Nop>

" Save files as root
cnoremap w!! execute ':w suda://%'

" +----------------+
" |  PHP config    |
" +----------------+
let g:PHP_removeCRwhenUnix = 1

" Remaps
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<cR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

lua << EOF

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local oK_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end


  -- Mappings.
  local opts = { noremap=true, silent=true }
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>Telescope lsp_definitions<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keyjap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  -- Enable completion triggered by <c-x><c-o>
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local opts = {
        capabilities = capabilities
    }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    incremental_selection = { enable = true, },
    indent = { enable = true },
    autotag = { enable = true, filetypes = { "html" , "xml", "html.mustache" } }
}

local parser_configs = require "nvim-treesitter.parsers".get_parser_configs()

parser_configs.mustache = {
  install_info = {
    url = "~/github/davidscotson/tree-sitter-mustache",
    files = {
      "src/parser.c",
    }
  },
  used_by = {
    "html.mustache",
  }
}
parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}

EOF

set mouse=a

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle=1

" Do this in lua?? maybe...
" vim.o is short for something teej thinks makes sense.
set completeopt=menu,menuone,longest,noselect,preview
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Firenvim
let g:firenvim_config = {
                        \ 'globalSettings': {
                        \ 'alt': 'all',
                        \  },
                        \ 'localSettings': {
                        \ '.*': {
                        \ 'cmdline': 'neovim',
                        \ 'priority': 0,
                        \ 'selector': 'textarea',
                        \ 'takeover': 'always',
                        \ },
                        \ }
                        \ }
let fc = g:firenvim_config['localSettings']
let fc['https://.*gmail.com.*'] = { 'takeover': 'never', 'priority': 1 }

augroup MY_FIRENVIM
        autocmd!
        au BufEnter github.com_*.txt set filetype=markdown
        au BufEnter stackoverflow_*.txt filetype=markdown
augroup END

nnoremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap <silent> k gk
    noremap <silent> j gj
    noremap <silent> 0 g0
    noremap <silent> $ g$
    onoremap <silent> j gj
    onoremap <silent> k gk
  endif
endfunction


" +-----------------+
" | general binding |
" +-----------------+

syntax on

set tabstop=4

"Toggle between absolute -> relative line number
nnoremap <Leader>nn :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<CR>

" +----------------+
" | general config |
" +----------------+

" vim test mapping, not using currently
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>


" Spelling corrections
:iabbrev calandar calendar
:iabbrev seperate separate

set diffopt+=algorithm:histogram
set diffopt+=indent-heuristic
set diffopt+=vertical


