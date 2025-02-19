local keymap = vim.keymap.set

keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

keymap("n", "<C-b>", vim.cmd.Ex) -- netrw

keymap("v", "J", ":m '>+1<CR>gv=gv") -- move selected line down
keymap("v", "K", ":m '<-2<CR>gv=gv") -- move selected line up

keymap("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

vim.keymap.set("n", "<leader>th", ":Telescope colorscheme<CR>")
