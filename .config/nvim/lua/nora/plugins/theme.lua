return {
	{
		"RRethy/base16-nvim",
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				colors = {
					bg = "#000000",
				},
			})
		end,
	},
}
