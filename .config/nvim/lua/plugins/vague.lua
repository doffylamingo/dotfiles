require("vague").setup({
    transparent = true,
    italic = false,
})

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
