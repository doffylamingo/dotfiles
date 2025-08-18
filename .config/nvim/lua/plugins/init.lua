vim.pack.add({
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/echasnovski/mini.statusline" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/echasnovski/mini.surround" },
    { src = "https://github.com/echasnovski/mini.completion" },
})

require("plugins.vague")

require("mini.statusline").setup({
    use_icons = false
})

require("mini.pick").setup()
require("mini.surround").setup()
require("mini.completion").setup({
    window = {
        info = { height = 25, width = 30, border = nil },
        signature = { height = 25, width = 80, border = nil },
    },
    lsp_completion = {
        source_func = 'omnifunc',
    },
})
