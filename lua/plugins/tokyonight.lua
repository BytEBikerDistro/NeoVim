-- ~/.config/nvim/lua/plugins/tokyonight.lua

return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = false,
      terminal_colors = true,
    })
    
    vim.cmd("colorscheme tokyonight")
  end,
}
