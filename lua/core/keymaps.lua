-- ~/.config/nvim/lua/core/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Toggle relative line numbers
keymap("n", "<leader>r", "<cmd>set relativenumber!<CR>", opts)

-- Clear search highlights
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

-- Buffer management
keymap("n", "<leader>bn", "<cmd>enew<CR>", opts)
keymap("n", "<Tab>", "<cmd>bnext<CR>", opts)
keymap("n", "<S-Tab>", "<cmd>bprevious<CR>", opts)
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", opts)

-- Window split management
keymap("n", "<leader>sv", "<cmd>vsplit<CR>", opts)
keymap("n", "<leader>sh", "<cmd>split<CR>", opts)
keymap("n", "<leader>sc", "<cmd>close<CR>", opts)
keymap("n", "<leader>so", "<cmd>only<CR>", opts)

-- Swap ; and : for easier command entry
keymap("n", ";", ":", opts)
keymap("n", ":", ";", opts)

-- VS Code-like keybindings
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "<Del>", '"_dw', opts)
keymap("v", "<Del>", '"_dw', opts)
keymap("n", "<C-a>", "ggVG", opts)

-- Terminal
keymap("n", "<leader>t", "<cmd>terminal<CR>", opts)

-- Termux clipboard support
if vim.fn.executable('termux-clipboard-set') == 1 then
  keymap("v", "<leader>y", ":w !termux-clipboard-set<CR><CR>", opts)
  keymap("n", "<leader>p", ":r !termux-clipboard-get<CR>", opts)
end
