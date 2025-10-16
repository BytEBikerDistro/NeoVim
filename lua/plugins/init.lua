-- ~/.config/nvim/lua/plugins/init.lua

require("lazy").setup({
  -- Performance
  { "lewis6991/impatient.nvim" },
  
  -- File explorer
  { import = "plugins.nvim-tree" },
  
  -- Status line
  { import = "plugins.lualine" },
  
  -- Syntax highlighting
  { import = "plugins.treesitter" },
  
  -- Fuzzy finder
  { import = "plugins.telescope" },
  
  -- Theme
  { import = "plugins.tokyonight" },
  
  -- LSP and completion
  { import = "plugins.coc" },
  
  -- Debugging
  { import = "plugins.vimspector" },
  
  -- Commenting
  { import = "plugins.commentary" },
  
  -- Auto pairs
  { import = "plugins.auto-pairs" },
})
