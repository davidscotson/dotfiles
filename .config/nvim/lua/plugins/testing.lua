return {
  { "andythigpen/nvim-coverage" },
  { "nvim-neotest/neotest-python" },
  { "nvim-neotest/neotest-jest" },
  { "nvim-neotest/neotest-vim-test" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-jest",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-vim-test",
    },
    -- Example for loading neotest-go with a custom config
    -- adapters = {
    --   ["neotest-go"] = {
    --     args = { "-tags=integration" },
    --   },
    -- },
  },
}
