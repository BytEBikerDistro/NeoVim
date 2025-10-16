-- ~/.config/nvim/lua/plugins/coc.lua

return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    -- Coc configuration will be loaded from coc-settings.json
    
    -- Keymaps
    vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { desc = "Go to definition" })
    vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { desc = "Go to type definition" })
    vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { desc = "Go to implementation" })
    vim.keymap.set("n", "gr", "<Plug>(coc-references)", { desc = "Show references" })
    
    vim.keymap.set("n", "K", function()
      local filetype = vim.bo.filetype
      if vim.tbl_contains({"vim","help"}, filetype) then
        vim.cmd("h " .. vim.fn.expand("<cword>"))
      elseif vim.fn.CocActionAsync("hasProvider", "hover") then
        vim.fn.CocActionAsync("doHover")
      else
        vim.cmd("!" .. vim.o.keywordprg .. " " .. vim.fn.expand("<cword>"))
      end
    end, { desc = "Show documentation" })
    
    -- Code actions and formatting
    vim.keymap.set("n", "<leader>ca", "<Plug>(coc-codeaction)", { desc = "Code action" })
    vim.keymap.set("n", "<leader>fm", "<cmd>CocCommand prettier.formatFile<CR>", { desc = "Format file" })
    
    -- Completion
    vim.keymap.set("i", "<Tab>", function()
      if vim.fn.pumvisible() == 1 then
        return "<C-n>"
      else
        return "<Tab>"
      end
    end, { expr = true })
    
    vim.keymap.set("i", "<S-Tab>", function()
      if vim.fn.pumvisible() == 1 then
        return "<C-p>"
      else
        return "<S-Tab>"
      end
    end, { expr = true })
    
    vim.keymap.set("i", "<CR>", function()
      if vim.fn.pumvisible() == 1 then
        return "<C-y>"
      else
        return "<CR>"
      end
    end, { expr = true })
  end,
}
