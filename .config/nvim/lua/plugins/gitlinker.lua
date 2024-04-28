return {
  {
    'ruifm/gitlinker.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      yadm = {
        enable = false
      },
    }
  }
}
