-- ~/.config/nvim/init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core configuration
require("core.options")
require("core.keymaps")
require("core.autocommands")

-- Load plugins
require("plugins")

-- === Lazy.nvim Configuration ===
  dev = { path = vim.fn.stdpath('config') .. '/local-plugins' },
  ui = {
    border = "rounded",
    icons = {
      loaded = "✔",
      not_loaded = "○",
    },
  },
})
