return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- shared lib for multiple lua plugins
    use 'nvim-lua/plenary.nvim'

    -- lsp Plugins
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/diagnostic-nvim'
    use 'tjdevries/nlua.nvim'
    use 'tjdevries/lsp_extensions.nvim'
    use 'wlemuel/vim-tldr'
    use 'williamboman/nvim-lsp-installer'

    -- completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- Snippets via LSP
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-vsnip'

    -- editorconfig
    use 'editorconfig/editorconfig-vim'

    -- Better diff lines
    use 'rickhowe/diffchar.vim'

    -- use 'ActivityWatch/aw-watcher-vim'

    -- browser wrapper
    use 'yuratomo/w3m.vim'

    -- unit testing /coverage
    use 'vim-test/vim-test'

    -- terminals
    use 'oberblastmeister/termwrapper.nvim'
    use 'akinsho/nvim-toggleterm.lua'
    use {
        'jghauser/kitty-runner.nvim',
        config = function()
            require('kitty-runner').setup()
        end
    }
    use {
        "nvim-neorg/neorg",
        config = function()
            require('neorg').setup {
                -- Tell Neorg what modules to load
                load = {
                    ["core.defaults"] = {}, -- Load all the default modules
                    ["core.norg.concealer"] = {}, -- Allows for use of icons
                    ["core.norg.completion"] = {
                        config = {
                            engine = "nvim-cmp" -- We current support nvim-compe and nvim-cmp only
                        }
                    },
                    ["core.keybinds"] = { -- Configure core.keybinds
                        config = {
                            default_keybinds = true, -- Generate the default keybinds
                            neorg_leader = "<Leader>o" -- This is the default if unspecified
                        }
                    },
                    ["core.norg.dirman"] = { -- Manage your directories with Neorg
                        config = {
                            workspaces = {
                                my_workspace = "~/neorg"
                            }
                        }
                    }
                },
            }
        end,
        requires = {"nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope"}
    }

    use {
        'lewis6991/spellsitter.nvim',
        config = function()
            require('spellsitter').setup()
        end
    }
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.opts)
        end
    }
    use {
        'ruifm/gitlinker.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
        end
        }
    -- REPL
    use 'metakirby5/codi.vim'

    use 'ggandor/lightspeed.nvim'
    use 'f-person/git-blame.nvim'

    -- status line, requires plenary
    use 'tjdevries/express_line.nvim'

    -- Neovim Tree sitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    })
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'windwp/nvim-ts-autotag'
    use 'p00f/nvim-ts-rainbow'

    use 'rcarriga/nvim-notify'

    use {
  "NTBBloodbath/rest.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        show_http_info = true,
        show_headers = true,
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })
  end
}
    -- telescope requirements...
    use 'nvim-lua/popup.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzf-native.nvim'
    use 'nvim-telescope/telescope-fzf-writer.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-telescope/telescope-ghq.nvim'
    use 'nvim-telescope/telescope-github.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    use 'tami5/sql.nvim' -- needed for frecency
    use 'nvim-telescope/telescope-frecency.nvim'
    use 'LinArcX/telescope-command-palette.nvim'
    -- icons for developer filetypes
    use 'kyazdani42/nvim-web-devicons'
    -- nicer SVG versions of the above
    use 'yamatsum/nvim-web-nonicons'

    -- color highlighter
    use {'rrethy/vim-hexokinase', { run = 'make hexokinase' }}

    -- treesitter themes
    use 'rktjmp/lush.nvim'
    -- use 'davidscotson/lush.nvim', {'branch': 'unreadable'}
    use 'savq/melange'
    use 'davidscotson/unreadable-nvim'

    use 'godlygeek/tabular'

    -- gutter display
    use 'airblade/vim-gitgutter'

    -- wrapper for git
    use 'tpope/vim-fugitive'
    -- fugitive for the hub
    use 'tpope/vim-rhubarb'
    -- surrounding text objects with whatever you want (paranthesis, quotes, html tags...)
    use 'tpope/vim-surround'
    -- the . command can repeat whatever you want!
    -- http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
    use 'tpope/vim-repeat'
    -- keystroke to comment automatically depending on the file you're in
    -- use 'tpope/vim-commentary'
    -- runs tests
    use 'tpope/vim-dispatch'
    -- simpler file navigation with netrw
    use 'tpope/vim-vinegar'
    -- DB plugin
    use 'tpope/vim-dadbod'

    -- gitk in vim
    use 'junegunn/gv.vim'

    -- php
    use {'alvan/vim-php-manual', ft = {'php'}}
    -- can vimspector do this
    use {'joonty/vdebug', ft = {'php'}}

    -- php doc autocompletion revisit
    use {'tobyS/vmustache', ft = {'php'}}
    use {'tobyS/pdv', ft = {'php'}}

    use 'mustache/vim-mustache-handlebars'

    -- TODO notes per repo
    -- Original project 'vuciv/vim-bujo'
    use 'davidscotson/vim-bujo'

    -- browser integration
     use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }

    -- Split arrays in PHP / struct in Go / other things
    use {'AndrewRadev/splitjoin.vim', ft = {'php'}}

    -- Write file with sudo
    use 'lambdalisue/suda.vim'

    -- switch number mode automaticall
    use 'jeffkreeftmeijer/vim-numbertoggle'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    end)
