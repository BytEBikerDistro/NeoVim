-- ~/.config/nvim/lua/plugins/coc.lua

return {
  "neoclide/coc.nvim",
  branch = "release",
  config = function()
    -- Coc configuration will be loaded from coc-settings.json

    local keymap = vim.keymap.set

    -- Basic Coc keymaps
    keymap('n', 'gd', '<Plug>(coc-definition)', { desc = 'Go to definition' })
    keymap('n', 'gy', '<Plug>(coc-type-definition)', { desc = 'Go to type definition' })
    keymap('n', 'gi', '<Plug>(coc-implementation)', { desc = 'Go to implementation' })
    keymap('n', 'gr', '<Plug>(coc-references)', { desc = 'Show references' })

    -- Enhanced hover behavior
    keymap('n', 'K', function()
      local filetype = vim.bo.filetype
      if vim.tbl_contains({ 'vim', 'help' }, filetype) then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
      else
        local ok, _ = pcall(vim.fn.CocAction, 'doHover')
        if not ok then
          vim.cmd('normal! ' .. vim.o.keywordprg .. vim.fn.expand('<cword>'))
        end
      end
    end, { desc = 'Show documentation' })

    -- Code actions and formatting
    keymap('n', '<leader>ca', '<Plug>(coc-codeaction)', { desc = 'Code action' })
    keymap('n', '<leader>fm', '<cmd>call CocAction("format")<CR>', { desc = 'Format file' })

    -- Smart completion behavior
    keymap('i', '<Tab>', function()
      if vim.fn.pumvisible() == 1 then
        return vim.fn['coc#pum#visible']() and vim.fn['coc#pum#next'](1) or '<Tab>'
      else
        return vim.fn['coc#expandableOrJumpable']() and '<C-r>=coc#rpc#request("doKeymap", ["snippets-expand-jump",""])<CR>' or '<Tab>'
      end
    end, { expr = true })

    keymap('i', '<S-Tab>', function()
      if vim.fn.pumvisible() == 1 then
        return vim.fn['coc#pum#visible']() and vim.fn['coc#pum#prev'](1) or '<S-Tab>'
      else
        return '<S-Tab>'
      end
    end, { expr = true })

    keymap('i', '<CR>', function()
      if vim.fn.pumvisible() == 1 then
        return vim.fn['coc#pum#visible']() and vim.fn['coc#pum#confirm']() or '<C-g>u<CR><C-r>=coc#on_enter()<CR>'
      else
        return '<C-g>u<CR><C-r>=coc#on_enter()<CR>'
      end
    end, { expr = true })

    -- Use <c-space> to trigger completion
    keymap('i', '<c-space>', 'coc#refresh()', { expr = true })

    -- Autoformat on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.json', '*.css', '*.scss', '*.md', '*.yaml', '*.yml' },
      callback = function()
        -- Check if Coc formatting is available
        if vim.fn.CocHasProvider('formatter') == 1 then
          vim.fn.CocAction('format')
        end
      end,
    })

    -- Highlight symbol under cursor
    vim.api.nvim_create_autocmd('CursorHold', {
      callback = function()
        if vim.fn.CocHasProvider('documentHighlight') == 1 then
          vim.fn.CocActionAsync('highlight')
        end
      end,
    })

    -- Clean up highlights when cursor moves
    vim.api.nvim_create_autocmd('CursorMoved', {
      callback = function()
        if vim.fn.CocHasProvider('documentHighlight') == 1 then
          vim.fn.CocActionAsync('clearHighlight')
        end
      end,
    })
  end,
}