return {
	"folke/which-key.nvim",
	cmd = "WhichKey",
	event = "VeryLazy",
	keys = { "<leader>", "<c-r>", '"', "'", "`", "c", "v", "g" },
	config = function()
		require("which-key").setup()
	end,
}
