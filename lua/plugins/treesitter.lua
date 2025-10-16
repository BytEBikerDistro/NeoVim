-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects", -- Optional but recommended
  },
  opts = {
    -- Automatically install missing parsers when entering buffer
    auto_install = true,
    
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    
    -- List of parsers to install
    ensure_installed = {
      "lua", "vim", "vimdoc", "javascript", "typescript", 
      "python", "html", "css", "json", "yaml", "markdown",
      "bash", "comment", "regex", "query" -- Added useful ones
    },
    
    -- List of parsers to ignore installing
    ignore_install = { "awk" },
    
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    
    indent = {
      enable = true,
    },
    
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    
    -- Additional modules (optional but useful)
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  },
  config = function(_, opts)
    -- Prefer safe require pattern
    local ok, treesitter = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("Treesitter not available!", vim.log.levels.WARN)
      return
    end
    
    treesitter.setup(opts)
    
    -- Optional: Additional safety for filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = opts.ensure_installed,
      callback = function(args)
        if vim.treesitter.highlighter.active[args.buf] then
          vim.notify(("Treesitter active for %s"):format(args.match), vim.log.levels.INFO)
        end
      end,
    })
  end,
}