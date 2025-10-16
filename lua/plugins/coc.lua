-- ~/.config/nvim/lua/plugins/coc.lua

return {
  'neoclide/coc.nvim',
    branch = 'release',
    config = function()
      require('coc')
    end,
}