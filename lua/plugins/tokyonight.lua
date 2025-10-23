-- ~/.config/nvim/lua/plugins/tokyonight.lua

return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "storm",
      transparent = false,
      terminal_colors = true,
      styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
  },
    })
    
    vim.cmd("colorscheme tokyonight")
  end,
}
