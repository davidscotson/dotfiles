return {
     'anuvyklack/pretty-fold.nvim',
     'nvim-lua/plenary.nvim', -- shared lib for multiple lua plugins,

     'dstein64/vim-startuptime',
     'tridactyl/vim-tridactyl',
     'airblade/vim-rooter',
     'neovim/nvim-lspconfig', -- lsp Plugins,
     'nvim-lua/diagnostic-nvim',
     'tjdevries/nlua.nvim',
     'tjdevries/lsp_extensions.nvim',
     'williamboman/nvim-lsp-installer',
     "akinsho/toggleterm.nvim",
     "windwp/nvim-autopairs",
     "tamago324/nlsp-settings.nvim", -- language server settings defined in json for,
     "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters,
     "b0o/schemastore.nvim",

     'hrsh7th/cmp-nvim-lsp',-- completion,
     'hrsh7th/cmp-buffer',
     'hrsh7th/cmp-path',
     'hrsh7th/cmp-cmdline',
     'hrsh7th/nvim-cmp',
     "saadparwaiz1/cmp_luasnip", -- snippet completions,

    -- snippets
   "L3MON4D3/LuaSnip", --snippet engine,
   "rafamadriz/friendly-snippets", -- a bunch of snippets to
    -- Lua
 
  "folke/trouble.nvim",

   'rickhowe/diffchar.vim', -- Better diff lines

    -- use 'ActivityWatch/aw-watcher-vim'

     'yuratomo/w3m.vim', -- browser wrapper

    -- unit testing /coverage
    -- use 'vim-test/vim-test' --

    -- terminals
        'jghauser/kitty-runner.nvim',
     "Pocco81/TrueZen.nvim",

        'lewis6991/spellsitter.nvim',
        "lewis6991/gitsigns.nvim",
     'TimUntersberger/neogit',
     'sindrets/diffview.nvim',
     'pappasam/nvim-repl',
        'ruifm/gitlinker.nvim', -- fugitive inspired range links
    -- REPL
     'metakirby5/codi.vim',

    --use 'ggandor/lightspeed.nvim'
    --use 'f-person/git-blame.nvim'
        'nvim-lualine/lualine.nvim',

    -- Neovim Tree sitter
	"nvim-treesitter/nvim-treesitter",
     'nvim-treesitter/playground',
     'nvim-treesitter/nvim-treesitter-textobjects',
     "JoosepAlviste/nvim-ts-context-commentstring",
     'windwp/nvim-ts-autotag',
     'p00f/nvim-ts-rainbow',

     'rcarriga/nvim-notify',


     'duane9/nvim-rg',
	'yamatsum/nvim-nonicons',
{
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
    -- treesitter themes
     --'rktjmp/lush.nvim',
     --'davidscotson/lush.nvim', {'branch' = 'unreadable'}
     --'savq/melange',
     --'davidscotson/unreadable-nvim',


     'godlygeek/tabular',

    -- wrapper for git
     'tpope/vim-fugitive',

     'tpope/vim-rsi',

    -- surrounding text objects with whatever you want (paranthesis, quotes, html tags...)
     'tpope/vim-surround',
    -- the . command can repeat whatever you want!
    -- http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
     'tpope/vim-repeat',

     'tpope/vim-unimpaired',

     'tpope/vim-vinegar',

     'tpope/vim-dadbod',

    -- gitk in vim
    --    use 'junegunn/gv.vim' -- lazy load?

    -- php
     -- {'alvan/vim-php-manual', ft = {'php'}},
    -- can vimspector do this
     -- {'joonty/vdebug', ft = {'php'}},

    -- php doc autocompletion revisit
     -- {'tobyS/vmustache', ft = {'php'}},
     -- {'tobyS/pdv', ft = {'php'}},

     'mustache/vim-mustache-handlebars', -- filetype

    -- browser integration
        'glacambre/firenvim',

    -- Write file with sudo
     'lambdalisue/suda.vim',

    -- switch number mode automaticall
     'jeffkreeftmeijer/vim-numbertoggle',

'numToStr/Comment.nvim'
}
