return {
  { "andythigpen/nvim-coverage", opts = {} },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-vim-test",
    },
    opts = {
      adapters = {
        ["neotest-vim-test"] = {},
      },
    },
  },
}
