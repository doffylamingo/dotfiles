vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/echasnovski/mini.statusline" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/echasnovski/mini.surround" },
})

require("plugins.vague")

require("mini.statusline").setup({
    use_icons = false
})

require("mini.pick").setup()
require("mini.surround").setup()
