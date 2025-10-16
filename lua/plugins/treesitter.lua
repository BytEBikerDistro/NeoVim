-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    auto_install = true,
    ensure_installed = {
      "lua", "vim", "vimdoc", "javascript", "typescript", 
      "python", "html", "css", "json", "yaml", "markdown"
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}