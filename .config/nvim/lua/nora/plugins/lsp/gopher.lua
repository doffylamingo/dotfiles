return {
	"olexsmir/gopher.nvim",
	ft = "go",
	keys = {
		{
			"<leader>gsj",
			"<cmd> GoTagAdd json <CR>",
			desc = "Add json struct tags",
		},
		{
			"<leader>gsy",
			"<cmd> GoTagAdd yaml <CR>",
			desc = "Add yaml struct tags",
		},
	},
	config = function()
		require("gopher").setup({})
	end,
	build = function()
		vim.cmd([[silent! GoInstallDeps]])
	end,
}
