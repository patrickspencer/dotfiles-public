-- Plugin keymaps (telescope, nvim-tree, flash, ...) live with their
-- plugin specs in lua/plugins/.
local map = vim.keymap.set

-- Base shortcuts
map("i", "kj", "<Esc>")
map("n", "<C-s>", "<cmd>w<CR>", { silent = true })
map({ "n", "v" }, ";", ":")

-- disable q (kept hitting q: by accident) and Ex mode
map("n", "q", "<Nop>")
map("n", "Q", "<Nop>")

-- Y yanks the whole line, like vim
vim.keymap.del("n", "Y")

-- Clipboard
map("v", "<C-c>", '"*y<cmd>echo "Text has been copied to clipboard"<CR>')
map("v", "<C-x>", '"*d<cmd>echo "Text has been cut"<CR>')
map("i", "<C-v>", "<C-r><C-o>*")
map("n", "<Leader>a", "<cmd>%y+<CR>", { desc = "Copy file to clipboard" })
map("n", "<Leader>e", "<cmd>set list!<CR>", { desc = "Toggle invisible characters" })

-- Opening files
map("n", "<Leader>ev", "<cmd>tabe $MYVIMRC<CR>", { silent = true, desc = "Edit init.lua" })
map("n", "<Leader>sv", "<cmd>so %<CR>", { silent = true, desc = "Source current file" })

-- Searching
map("n", "<Leader>q", "<cmd>nohlsearch<CR>", { silent = true })
-- Keep search matches in the middle of the window.
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Movement between tabs
map("", "<C-h>", "gT")
map("", "<C-l>", "gt")

-- Ctrl-j/k inserts a blank line below/above without moving the cursor.
map("n", "<C-j>", function()
  vim.fn.append(vim.fn.line("."), "")
end, { silent = true })
map("n", "<C-k>", function()
  vim.fn.append(vim.fn.line(".") - 1, "")
end, { silent = true })
