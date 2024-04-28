return {
  {
    "telescope.nvim",
    opts = {
      defaults = {
        border = true,
        borderchars = {
          prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
          results = { " ", " ", " ", " ", " ", " ", " ", " " },
          preview = { " ", " ", " ", " ", " ", " ", " ", " " },
        },
        layout_config = {
          horizontal = { width = 0.9999, height = 0.9999 },
        },
      },
      pickers = {
        live_grep = {
          disable_coordinates = true,
          additional_args = { '--trim' },
          path_display =  {shorten = { len = 2, exclude = {-1, -2, -3} }},
        },
        help_tags = {
          mappings = {
            i = {
              ["<CR>"] = require('telescope.actions').file_vsplit,
            }
          }
        }
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      'mrjones2014/tldr.nvim',
      opts = {
        tldr_args = '--color=always'
      }
    }
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
}
