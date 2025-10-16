-- ~/.config/nvim/lua/core/keymaps.lua

local map = vim.keymap.set

-- ============ Insert Mode Navigation =============
map("i", "<C-b>", "<ESC>^i", { desc = "Move to beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- ============ Auto Pairs =============
local opts = { noremap = true, silent = true }

local function setup_auto_pairs(pairs_list)
    for _, pair in ipairs(pairs_list) do
        local open, close = pair[2], pair[2]

        -- Insert mode
        map('i', open, open .. close .. '<Left>', opts)

        -- Normal mode
        map('n', open, 'a' .. open .. close .. '<Esc>i', opts)

        -- Visual mode: wrap selection
        map('x', open, 'c' .. open .. close .. '<Esc>P', opts)
    end
end

-- Configure all your pairs in one place
setup_auto_pairs({
    { '(', ')' },
    { '[', ']' },
    { '{', '}' },
    { '<', '>' },
    { "'", "'" },
    { '"', '"' },
    { '`', '`' }
})

-- ============ Window Navigation =============
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })

-- ============ Easy Command Entry =============
map('n', ';', ':', { desc = 'Enter command mode' })
map('n', ':', ';', { desc = 'Repeat f, t, F or T' })

-- ============ Saving & Clipboard =============
map("i", "<C-s>", "<Esc><Cmd>write<CR>", { noremap = true, silent = true, desc = "Save and exit insert mode" })
map("n", "<C-s>", "<Cmd>write<CR>", { noremap = true, silent = true, desc = "Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file to clipboard" })

-- ============ Search & Highlight =============
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlights" })

-- ============ Line Number Toggle =============
map("n", "<leader>r", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })

-- ============ File Explorer =============
map({ "n", "v", "i" }, "<C-n>", "<cmd>NvimTreeToggle<CR>", { remap = true, desc = "Toggle NvimTree" })

-- ============ Telescope Mappings =============
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
map(
    "n",
    "<leader>fa",
    "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
    { desc = "Find all files" }
)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Grep through files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List open buffers" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Recent files" })

-- ============ Terminal Mode =============
map('n', '<leader>t', '<cmd>terminal<CR>', { desc = 'Open terminal' })

-- ============ Plugin Tools =============
map("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Open Lazy plugin manager" })

-- ============ Notifications =============
map("n", "<leader>n", "<cmd>NoiceDismiss<CR>", { noremap = true, desc = "Dismiss notifications" })
map("n", "<leader>N", "<cmd>Noice telescope<CR>", { noremap = true, desc = "Noice history" })

-- ============ Code Runner =============
map("n", "<leader>e", "<cmd>RunFile<CR>", { desc = "Run current file" })
map("n", "<leader>ep", "<cmd>RunProject<CR>", { desc = "Run entire project" })
map("n", "<leader>ec", "<cmd>RunClose<CR>", { desc = "Close runner" })

-- ============ Buffers & Tabs =============
map('n', '<leader>bn', ':enew<CR>', { desc = 'New buffer', silent = true })
map('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer', silent = true })
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- ============ Splits =============
map("n", "<leader>sv", "<cmd>vsp<cr>", { noremap = true, silent = true, desc = "Vertical split" })
map("n", "<leader>sh", "<cmd>sp<cr>", { noremap = true, silent = true, desc = "Horizontal split" })
map('n', '<leader>sc', ':close<CR>', { desc = 'Close window', silent = true })
map('n', '<leader>so', ':only<CR>', { desc = 'Close other windows', silent = true })

-- ============ Select All =============
map("n", "<C-a>", "ggVG", { noremap = true, silent = true, desc = "Select all text" })

-- ============ Todo Comments =============
map("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next Todo Comment" })
map("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous Todo Comment" })

-- ============ Commenting =============
map({ "n", "v" }, "<leader>/", "gcc", { desc = "Toggle comment", remap = true })

-- ============ Normal Mode Delete Word (No Yank) =============
map({ "n", "v" }, "<Del>", '"_dw', { noremap = true, silent = true, desc = "Delete word (no yank)" })

-- ============ VS Code-Like Keybindings =============

map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Undo / Redo
map("i", "<C-z>", "<Esc>ua", { noremap = true, desc = "Undo in insert mode" })

-- Redo (note: <C-r> is redo in normal mode)
map("i", "<C-S-z>", "<Esc><C-r>a", { noremap = true, desc = "Redo in insert mode" })

-- Clipboard-like behavior
map("v", "<C-x>", '"+d', { noremap = true, desc = "Cut to clipboard" })
map("v", "<C-c>", '"+y', { noremap = true, desc = "Copy to clipboard" })
map("i", "<C-v>", "<C-r>+", { noremap = true, desc = "Paste clipboard" })
map("n", "<C-v>", '"+p', { noremap = true, desc = "Paste clipboard" })


