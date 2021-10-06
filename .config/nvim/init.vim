call plug#begin('~/.local/share/nvim/plugged')

" shared lib for multiple lua plugins
Plug 'nvim-lua/plenary.nvim'

" lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'wlemuel/vim-tldr'
Plug 'kabouzeid/nvim-lspinstall'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" Better diff lines
Plug 'rickhowe/diffchar.vim'

Plug 'ActivityWatch/aw-watcher-vim'
" Snippets via LSP
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

" browser wrapper
Plug 'yuratomo/w3m.vim'

" unit testing /coverage
Plug 'im-test/vim-test'

" terminals
Plug 'oberblastmeister/termwrapper.nvim'
Plug 'akinsho/nvim-toggleterm.lua'

" REPL
Plug 'metakirby5/codi.vim'

" status line, requires plenary
Plug 'tjdevries/express_line.nvim'

" Neovim Tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'windwp/nvim-ts-autotag'
Plug 'p00f/nvim-ts-rainbow'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'nvim-telescope/telescope-fzf-writer.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-ghq.nvim'
Plug 'nvim-telescope/telescope-github.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'tami5/sql.nvim' " needed for frecency
Plug 'nvim-telescope/telescope-frecency.nvim'

" icons for developer filetypes
Plug 'kyazdani42/nvim-web-devicons'
" nicer SVG versions of the above
Plug 'yamatsum/nvim-web-nonicons'

" color highlighter
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" treesitter themes
"Plug 'rktjmp/lush.nvim', {'branch': 'feat-mix'}
Plug 'davidscotson/lush.nvim', {'branch': 'unreadable'}
Plug 'savq/melange'
Plug 'davidscotson/unreadable-nvim'

Plug 'godlygeek/tabular'

" gutter display
Plug 'airblade/vim-gitgutter'

" wrapper for git
Plug 'tpope/vim-fugitive'
" fugitive for the hub
Plug 'tpope/vim-rhubarb'
" surrounding text objects with whatever you want (paranthesis, quotes, html tags...)
Plug 'tpope/vim-surround'
" the . command can repeat whatever you want!
" http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
Plug 'tpope/vim-repeat'
" keystroke to comment automatically depending on the file you're in
Plug 'tpope/vim-commentary'
" runs tests
Plug 'tpope/vim-dispatch'
" simpler file navigation with netrw
Plug 'tpope/vim-vinegar'
" DB plugin
Plug 'tpope/vim-dadbod'

" gitk in vim
Plug 'junegunn/gv.vim'

" php
Plug 'alvan/vim-php-manual', {'for': 'php'}
" can vimspector do this
Plug 'joonty/vdebug', {'for': 'php'}

" php doc autocompletion revisit
Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'}

Plug 'mustache/vim-mustache-handlebars'

" TODO notes per repo
"Original project 'vuciv/vim-bujo'
Plug 'davidscotson/vim-bujo'

" browser integration
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Split arrays in PHP / struct in Go / other things
Plug 'AndrewRadev/splitjoin.vim', {'for': 'php'}

" Write file with sudo
Plug 'lambdalisue/suda.vim'

" switch number mode automaticall
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()

" General setttings

" Sets
colorscheme unreadable

" Keep buffers with unsaved changes around
set hidden

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround
set nowrap
set termguicolors
set signcolumn=yes

" show command effects as you write them
set inccommand=nosplit

" TODO for css naming of words, only in CSS?
set isfname+=@-@

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

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" paste from system clipboard
vnoremap <leader>p "+p
nnoremap <leader>p "+p
" yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" delete and send to black hole, don't update yank buffer
nnoremap <leader>d "_d
vnoremap <leader>d "_d


let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'

let g:bujo#window_width = 45

let g:vim_markdown_conceal = 1
let g:vim_markdown_new_list_item_indent = 0

let g:markdown_fenced_languages = ['html', 'php', 'python', 'shell=sh', 'bash=sh']

" Syntax print
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
        if !exists("*synstack")
                return
        endif
        echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


nnoremap <leader>ps :lua require'telescope'.extensions.fzf_writer.staged_grep()<CR>
nnoremap <leader>pg :lua require'telescope.builtin'.git_files()<CR>
nnoremap <leader>pf :lua require'telescope'.extensions.fzf_writer.find_files()<CR>
nnoremap <leader>pp :lua require'telescope'.extensions.project.project{ display_type = 'full'}<CR>

nnoremap <leader>pw :lua require'telescope'.extensions.fzf_writer.staged_grep { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require'telescope.builtin'.buffers()<CR>
 
lua << EOF
-- turn this into a telescope "theme"
require('telescope').setup{
    extensions = {
        fzf_writer = {
            minimum_grep_characters = 2,
            minimum_files_characters = 2,
            use_highlighter = true,
        }
    }
}

require"telescope".load_extension("ghq")
require"telescope".load_extension("gh")

-- express line statusline
require('el').setup()

EOF

augroup MYSTUFF
        autocmd!
        " open all splits verticall
        autocmd WinNew * wincmd L
        " briefly higlight yanked text
        autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 400})
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

" Act like D and C
nnoremap Y y$

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

" " move this to project specific location for standardebooks
" au BufNewFile,BufRead *.py
"                         \ set tabstop=4 |
"                         \ set softtabstop=4 |
"                         \ set shiftwidth=4 |
"                         \ set textwidth=79 |
"                         \ set noexpandtab |
"                         \ set fileformat=unix


" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
        nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Remaps
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

let g:python_host_prog = '/Users/davidscotson/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/davidscotson/.pyenv/versions/neovim3/bin/python'

lua << EOF
require"toggleterm".setup{
  -- using Tag mapping.
  open_mapping = [[<c-t>]],
  shade_terminals = true,
  start_in_insert = true,
}

require'lspinstall'.setup() -- important

require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    incremental_selection = { enable = true, },
    indent = { enable = true },
    autotag = { enable = true, filetypes = { "html" , "xml", "html.mustache" } }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.mustache = {
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
EOF

set mouse=a

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle=1

" Do this in lua?? maybe...
" vim.o is short for something teej thinks makes sense.
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :lua vim.lsp.diagnostic.set_loclist()<CR>

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

noremap <silent> <Leader>w :call ToggleWrap()<CR>
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


let g:vim_markdown_folding_disabled = 1
" +-----------------+
" | general binding |
" +-----------------+

syntax on

" Act like D and C
nnoremap Y y$

" indent without kill the selection in vmode
vmap < <gv
vmap > >gv

set tabstop=4
set shiftwidth=0
set expandtab

" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround


" remap the annoying u in visual mode
vmap u y

" Change in next bracket
nmap cinb cib

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call general#VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call general#VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"Toggle between absolute -> relative line number
nnoremap <C-n> :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<CR>


" Disable anoying ex mode
nnoremap Q <Nop>

" Save files as root
cnoremap w!! execute ':w suda://%'

" +----------------+
" | general config |
" +----------------+

" colorscheme
set termguicolors
colorscheme unreadable

let g:lexima_enable_basic_rules=0

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" vim test mapping
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
