local map = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '



map("n", "<leader>w", ":w<cr>", { desc = "Save file", remap = true })

map("i", "jk", "<ESC>", { desc = "jk to esc", noremap = true })

map("n", "<leader>q", ":q<cr>", { desc = "Quit Neovim", remap = true })


map("n", "+", "<C-a>", { desc = "Increment numbers", noremap = true })
map("n", "-", "<C-x>", { desc = "Decrement numbers", noremap = true })

map("n", "<C-a>", "gg<S-v>G", { desc = "Select all", noremap = true })


map("v", "<", "<gv", { desc = "Indenting", silent = true, noremap = true })
map("v", ">", ">gv", { desc = "Indenting", silent = true, noremap = true })

map("n", "te", ":tabedit")

map("n", "<leader>sh", ":split<Return><C-w>w", { desc = "splits horizontal", noremap = true })
map("n", "<leader>sv", ":vsplit<Return><C-w>w", { desc = "Split vertical", noremap = true })

map("n", "<C-k>", "<C-w>k", { desc = "Navigate up" })
map("n", "<C-j>", "<C-w>j", { desc = "Navigate down" })
map("n", "<C-h>", "<C-w>h", { desc = "Navigate left" })
map("n", "<C-l>", "<C-w>l", { desc = "Navigate right" })

map("n", "<C-Up>", ":resize -3<CR>")
map("n", "<C-Down>", ":resize +3<CR>")
map("n", "<C-Left>", ":vertical resize -3<CR>")
map("n", "<C-Right>", ":vertical resize +3<CR>")


map("n", "<Tab>", ":BufferNext<CR>", { desc = "Move to next tab", noremap = true })

map("n", "<S-Tab>", ":BufferPrevious<CR>", { desc = "Move to previous tab", noremap = true })
map("n", "<leader>x", ":BufferClose<CR>", { desc = "Buffer close", noremap = true })
map("n", "<A-p>", ":BufferPin<CR>", { desc = "Pin buffer", noremap = true })
