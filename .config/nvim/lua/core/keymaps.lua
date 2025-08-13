local keymap = vim.keymap.set

keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<C-b>", vim.cmd.Ex)

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- lsp
keymap("n", "<leader>fm", vim.lsp.buf.format)
keymap("i", "<C-Space>", vim.lsp.completion.get)

-- picker
keymap('n', '<C-p>', ":Pick files<CR>")
keymap('n', '<C-S-p>', ":Pick grep_live<CR>")
keymap('n', '<leader>h', ":Pick help<CR>")
