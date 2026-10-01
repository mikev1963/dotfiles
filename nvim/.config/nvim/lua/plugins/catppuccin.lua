vim.pack.add { 
  { src = "https://github.com/catppuccin/nvim", 
  name = "catppuccin" } 
}

require("catppuccin").setup({
  flavour = "mocha",
  background = {
        light = "latte",
        dark = "mocha",
  },
  transparent_background = false,
})

vim.cmd.colorscheme("catppuccin-nvim")
