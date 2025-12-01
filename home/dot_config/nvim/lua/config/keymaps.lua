-- ============================================================================
-- Keymaps configuration
-- ============================================================================


-----------
-- Basic --
-----------

-- Leader key configuration
vim.g.mapleader = " "                                               -- set Leader to <Space>
vim.g.maplocalleader = "\\"                                         -- retain backslash as local Leader for specific filetypes (like LaTeX)
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true }) -- disable default <Space> mapping

-- Helper function for setting keymaps with default options
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  if opts.silent == nil then opts.silent = true end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Exit insert mode quickly
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("i", "jj", "<Esc>", { desc = "Exit insert mode (alternative)" })

-- Use Ctrl + s to save the current file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<CR><esc>", { desc = "Save file" })


---------------------------------
-- Text editing and operations --
---------------------------------

-- Better join lines (keep cursor position)
map("n", "J", "mzJ`z")

-- Better scrolling (keep cursor centered)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Better search navigation (keep cursor centered)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better indenting in visual mode (keep selection)
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Use <Esc> to clear search highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Use J/K to move the selected block down or up in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Use <leader> + x/d to delete without copying to the default register
map({ "n", "v" }, "<leader>x", [["_x]], { desc = "Delete without copying" })
map({ "n", "v" }, "<leader>X", [["_X]], { desc = "Delete without copying (alternative)" })
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without copying" })
map({ "n", "v" }, "<leader>D", [["_D]], { desc = "Delete without copying (alternative)" })

-- Use <leader> + c to change without copying to the default register
map({ "n", "v" }, "<leader>c", [["_c]], { desc = "Change without copying" })
map({ "n", "v" }, "<leader>C", [["_C]], { desc = "Change without copying (alternative)" })

-- Use <leader> + y to yank to the system clipboard
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "Yank to system clipboard (alternative)" })

-- Use <leader> + p to paste from the system clipboard
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
map({ "n", "v" }, "<leader>P", [["+P]], { desc = "Paste from system clipboard (alternative)" })

-- Quickly replace word under cursor throughout the file
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })


------------------------
-- Windows management --
------------------------

-- Use Ctrl + h/j/k/l to navigate between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Use Ctrl + Arrow keys to resize windows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window up" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window down" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window right" })
