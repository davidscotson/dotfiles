local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    use 'nvim-lua/plenary.nvim' -- shared lib for multiple lua plugins


    use 'dstein64/vim-startuptime'
    use 'tridactyl/vim-tridactyl'
    use 'airblade/vim-rooter'
    use 'neovim/nvim-lspconfig' -- lsp Plugins
    use 'nvim-lua/diagnostic-nvim'
    use 'tjdevries/nlua.nvim'
    use 'tjdevries/lsp_extensions.nvim'
    use 'williamboman/nvim-lsp-installer'
    use "akinsho/toggleterm.nvim"
    use "windwp/nvim-autopairs"
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    use 'hrsh7th/cmp-nvim-lsp' -- completion
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use "saadparwaiz1/cmp_luasnip" -- snippet completions

    -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
    -- Lua
use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
        position = "right",
        padding = false,
        indent_lines = false,
        use_diagnostic_signs = true,
    }
  end
}

    use 'rickhowe/diffchar.vim' -- Better diff lines

    -- use 'ActivityWatch/aw-watcher-vim'

    use 'yuratomo/w3m.vim' -- browser wrapper

    -- unit testing /coverage
    -- use 'vim-test/vim-test' --

    -- terminals
    use {
        'jghauser/kitty-runner.nvim',
        config = function()
            require('kitty-runner').setup()
        end
    }
    use {
        "nvim-neorg/neorg",
        requires = {"nvim-lua/plenary.nvim", "nvim-neorg/neorg-telescope"}
    }
    use "Pocco81/TrueZen.nvim"

    use {
        'lewis6991/spellsitter.nvim',
        config = function()
            require('spellsitter').setup()
        end
    }
    use "lewis6991/gitsigns.nvim"
    use 'TimUntersberger/neogit'
    use {
        'ruifm/gitlinker.nvim', -- fugitive inspired range links
        requires = 'nvim-lua/plenary.nvim',
    }
    -- REPL
    use 'metakirby5/codi.vim'

    --use 'ggandor/lightspeed.nvim'
    --use 'f-person/git-blame.nvim'
    use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Neovim Tree sitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use 'windwp/nvim-ts-autotag'
    use 'p00f/nvim-ts-rainbow'

    use 'rcarriga/nvim-notify'

    use {
  "NTBBloodbath/rest.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("rest-nvim").setup({
      -- Open request results in a horizontal spli:h alpha-examplet
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

use 'duane9/nvim-rg'

use {'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    requires = {
        'nvim-telescope/telescope.nvim',
        'nvim-telescope/telescope-ghq.nvim',
        'cljoly/telescope-repo.nvim',
        'nvim-lua/plenary.nvim',
        'mrjones2014/tldr.nvim',
        "nvim-telescope/telescope-file-browser.nvim",
        'nvim-telescope/telescope-rg.nvim',
    },
    config = function()
        require'telescope'.load_extension'ghq'
        require'telescope'.load_extension'repo'
        require'telescope'.load_extension'fzf'
    end,
}
    use 'tami5/sql.nvim' -- needed for frecency
    -- use 'nvim-telescope/telescope-frecency.nvim'
    -- use 'LinArcX/telescope-command-palette.nvim'

    use {
    'yamatsum/nvim-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- treesitter themes
    use 'rktjmp/lush.nvim'
    -- use 'davidscotson/lush.nvim', {'branch': 'unreadable'}
    use 'savq/melange'
    use 'davidscotson/unreadable-nvim'


    use 'godlygeek/tabular'

    -- wrapper for git
    use 'tpope/vim-fugitive'

    -- surrounding text objects with whatever you want (paranthesis, quotes, html tags...)
    use 'tpope/vim-surround'
    -- the . command can repeat whatever you want!
    -- http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
    use 'tpope/vim-repeat'

    use 'tpope/vim-unimpaired'

    use 'tpope/vinegar'

    use 'tpope/vim-dadbod'

    -- gitk in vim
--    use 'junegunn/gv.vim' -- lazy load?

    -- php
    use {'alvan/vim-php-manual', ft = {'php'}}
    -- can vimspector do this
    use {'joonty/vdebug', ft = {'php'}}

    -- php doc autocompletion revisit
    use {'tobyS/vmustache', ft = {'php'}}
    use {'tobyS/pdv', ft = {'php'}}

    use 'mustache/vim-mustache-handlebars' -- filetype

    -- browser integration
     use {
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end
    }

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

  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
