
local keymap = vim.keymap.set

-- Basic Coc keymaps (mirrors your old config)
keymap('n', 'gd', '<Plug>(coc-definition)', { desc = 'Go to definition' })
keymap('n', 'gy', '<Plug>(coc-type-definition)', { desc = 'Go to type definition' })
keymap('n', 'gi', '<Plug>(coc-implementation)', { desc = 'Go to implementation' })
keymap('n', 'gr', '<Plug>(coc-references)', { desc = 'Show references' })

-- Hover / K behaviour
keymap('n', 'K', function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({'vim', 'help'}, filetype) then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.fn.CocActionAsync and vim.fn.CocActionAsync('hasProvider', 'hover') == 1 then
    vim.fn.CocActionAsync('doHover')
  else
    vim.cmd('!' .. vim.o.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
  end
end, { desc = 'Show documentation' })

-- Code actions, formatting
keymap('n', '<leader>ca', '<Plug>(coc-codeaction)', { desc = 'Code action' })
keymap('n', '<leader>f', '<cmd>CocCommand prettier.formatFile<CR>', { desc = 'Format file' })

-- Completion <Tab> behavior (preserve your original logic)
keymap('i', '<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return vim.api.nvim_replace_termcodes('<C-n>', true, false, true)
  else
    return '<Tab>'
  end
end, { expr = true })

keymap('i', '<S-Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return vim.api.nvim_replace_termcodes('<C-p>', true, false, true)
  else
    return vim.api.nvim_replace_termcodes('<S-Tab>', true, false, true)
  end
end, { expr = true })

keymap('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    return vim.api.nvim_replace_termcodes('<C-y>', true, false, true)
  else
    return '<CR>'
  end
end, { expr = true })

-- Autoformat on save for common filetypes using Coc
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.json', '*.css', '*.scss', '*.md', '*.yaml', '*.yml' },
  callback = function()
    if vim.fn.CocAction('format') then
      vim.cmd('silent call CocAction("format")')
    end
  end,
})