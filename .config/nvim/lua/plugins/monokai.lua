return {
  -- add gruvbox
  { "https://gitlab.com/__tpb/monokai-pro.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokaipro",
    },
  },
}
