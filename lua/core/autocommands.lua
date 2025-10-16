-- ~/.config/nvim/lua/core/autocommands.lua

local augroup = vim.api.nvim_create_augroup("user_config", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank({ timeout = 300 })
  end,
})

-- Auto-format using coc-prettier for specific filetypes
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.css", "*.scss", "*.md", "*.yaml", "*.yml" },
  callback = function()
    if vim.fn.CocAction("format") then
      vim.cmd('silent call CocAction("format")')
    end
  end,
})
