vim.g.mapleader = " "

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-q>", ":q<CR>")

vim.keymap.set("v", "<C-y>", '"+y')

vim.keymap.set("n", "<F2>", ':lua vim.diagnostic.open_float(0, {scope="line"})<CR>')
