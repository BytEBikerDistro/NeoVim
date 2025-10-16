-- ~/.config/nvim/lua/plugins/init.lua

require("lazy").setup({

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

-- Dashboard
  { import = "plugins.alpha" },

-- Buffer line
  { import = "plugins.bufferline" },

-- Code Runner
  { import = "plugins.code_runner" },

-- Indentation
  { import = "plugins.indentscope" },

-- Notification
  { import = "plugins.noice" },

-- TODO Comments
  { import = "plugins.to-do" },

-- Teminal Float
  { import = "plugins.toggleterm" },

  -- LSP and completion
  { import = "plugins.coc" },

})