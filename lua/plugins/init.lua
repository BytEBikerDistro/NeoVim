-- ~/.config/nvim/lua/plugins/init.lua

require("lazy").setup({
  -- Theme (should be loaded first)
  { import = "plugins.tokyonight" },

  -- File explorer
  { import = "plugins.nvim-tree" },

  -- Status line
  { import = "plugins.lualine" },

  -- Buffer line
  { import = "plugins.bufferline" },

  -- Dashboard
  { import = "plugins.alpha" },

  -- Syntax highlighting
  { import = "plugins.treesitter" },

  -- Fuzzy finder
  { import = "plugins.telescope" },

  -- Code Runner
  { import = "plugins.code_runner" },

  -- Indentation guides
  { import = "plugins.indentscope" },

  -- Notification system
  { import = "plugins.noice" },

  -- TODO Comments
  { import = "plugins.to-do" },

  -- Floating terminal
  { import = "plugins.toggleterm" },
})
