return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "css",
        "vue",
        "json",
        "json5",
        "jsonc",
      })
    end,
  },
  {'subnut/nvim-ghost.nvim'},
  {'epwalsh/obsidian.nvim'},
  {
  "rest-nvim/rest.nvim",
    keys = {
      {
        "<leader>rr",
        "<Plug>RestNvim",
      },
      {
        "<leader>rp",
        "<Plug>RestNvimPreview",
        desc = "Show REST preview"
      },
      {
        "<leader>r.",
        "<Plug>RestNvimRerunLast",
        desc = "Re-run REST"
      },
    },
  }
}

