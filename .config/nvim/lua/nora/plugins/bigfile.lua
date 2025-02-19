return {
	"LunarVim/bigfile.nvim",
	event = "BufReadPre",
	opts = {
		filesize = 2,
	},
	config = function()
		require("bigfile").setup()
	end,
}
