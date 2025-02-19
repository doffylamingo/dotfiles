return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Mark file with harpoon",
		},
		{
			"<C-e>",
			function()
				local harpoon = require("harpoon")

				--Use builtin harpoon ui
				harpoon.ui:toggle_quick_menu(harpoon:list())

				-- use telescope ui
				-- local conf = require("telescope.config").values
				-- local function toggle_telescope(harpoon_files)
				--     local file_paths = {}
				--     for _, item in ipairs(harpoon_files.items) do
				--         table.insert(file_paths, item.value)
				--     end
				--
				--     require("telescope.pickers").new({}, {
				--         prompt_title = "Harpoon",
				--         finder = require("telescope.finders").new_table({
				--             results = file_paths,
				--         }),
				--         previewer = conf.file_previewer({}),
				--         sorter = conf.generic_sorter({}),
				--     }):find()
				-- end
				-- toggle_telescope(harpoon:list())
			end,
			desc = "View marked files",
		},
		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Go to the first marked file",
		},
		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Go to the second marked file",
		},
		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Go to the third marked file",
		},
		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Go to the fourth marked file",
		},
		{
			"<C-N>",
			function()
				require("harpoon"):list():next()
			end,
			desc = "Go to next harpoon mark",
		},
		{
			"<C-M>",
			function()
				require("harpoon"):list():prev()
			end,
			desc = "Go to previous harpoon mark",
		},
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})
	end,
}
