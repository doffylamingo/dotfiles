return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		--transparent = true,
		background = {
			dark = "dragon",
		},
		colors = {
			palette = {
				white = "#edeff0",
				darker_black = "#060809",
				black = "#0c0e0f", --  nvim bg
				black2 = "#141617",
				lighter_black = "#121415",
				one_bg = "#161819",
				one_bg2 = "#1f2122",
				one_bg3 = "#27292a",
				grey = "#343637",
				grey_fg = "#3e4041",
				grey_fg2 = "#484a4b",
				light_grey = "#505253",
				red = "#DF5B61",
				baby_pink = "#EE6A70",
				pink = "#e8646a",
				line = "#1b1d1e",
				green = "#78B892",
				vibrant_green = "#81c19b",
				nord_blue = "#5A84BC",
				blue = "#6791C9",
				yellow = "#ecd28b",
				sun = "#f6dc95",
				purple = "#c58cec",
				dark_purple = "#BC83E3",
				teal = "#70b8ca",
				orange = "#E89982",
				cyan = "#67AFC1",
				statusline_bg = "#101213",
				lightbg = "#1d1f20",
				pmenu_bg = "#78B892",
				folder_bg = "#6791C9",

				base00 = "#0c0e0f",
				base01 = "#121415",
				base02 = "#161819",
				base03 = "#1f2122",
				base04 = "#27292a",
				base05 = "#edeff0",
				base06 = "#e4e6e7",
				base07 = "#f2f4f5",
				base08 = "#f26e74",
				base09 = "#ecd28b",
				base0A = "#e79881",
				base0B = "#82c29c",
				base0C = "#6791C9",
				base0D = "#709ad2",
				base0E = "#c58cec",
				base0F = "#e8646a",

				dragonBlack0 = "#181616",
				dragonBlack1 = "#12120f",
				dragonBlack2 = "#1D1C19",
				dragonBlack3 = "#0d0c0c",
				dragonBlack4 = "#282727",
				dragonBlack5 = "#393836",
				dragonBlack6 = "#343637",

				dragonRed = "#f26e74",
				dragonViolet = "#c58cec",
				dragonWhite = "#f9e7c0",
				dragonGreen = "#82c29c",
				dragonGreen2 = "#78b892",
				dragonYellow = "#f0df8a",
				dragonGray = "#3e4041",
				dragonPink = "#e8646a",
				dragonBlue2 = "#709ad2",
				dragonOrange = "#e79881",

				dragonOrange2 = "#b98d7b",
				dragonGray2 = "#9e9b93",
				dragonGray3 = "#7a8382",
				dragonAqua = "#8ea4a2",
				dragonAsh = "#737c73",
				dragonTeal = "#949fb5",
			},
			theme = {
				all = {
					syn = {
						string = "#98bb6c",
						variable = "none",
						type = "#e79881",
						-- number     = "#f0df8a",
						-- constant   = "#f0df8a",
						-- identifier = "#c9c7be",
						parameter = "#ffa066",
						-- fun        = "#f26e74",
						-- statement  = "#ffa455",
						-- keyword    = "#ffb454",
						operator = "#c9c7be",
						-- punct      = "#f26e74",
						-- regex      = "#f26e74",
						-- deprecated = "#3e4041",
						-- preproc    = "#c9c7be",
						-- comment    = "#c58cec",
						special1 = "#f26e74",
						special2 = "#f26e74",
						-- special3   = "#e79881",
					},
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
		overrides = function(colors)
			local palette = colors.palette
			return {
				MatchWord = { bg = palette.dragonBlack6, fg = palette.dragonWhite },
				MatchParen = { link = "MatchWord" },

				Pmenu = { bg = palette.dragonBlack1 },
				PmenuSel = { bg = palette.dragonGreen2, fg = palette.dragonBlack1, bold = true },
				CmpItemAbbr = { fg = palette.dragonWhite },
				CmpItemAbbrMatch = { fg = palette.dragonBlue2 },
				CmpItemAbbrMatchFuzzy = {},
				CmpPmenu = { bg = palette.dragonBlack3 },
				CmpSel = { link = "PmenuSel", bold = true },

				Comment = { fg = palette.grey_fg },
				CursorLineNr = { fg = palette.white },
				LineNr = { fg = palette.grey },

				-- floating windows
				FloatBorder = { fg = palette.blue },
				NormalFloat = { bg = palette.darker_black },

				NvimInternalError = { fg = palette.red },
				WinSeparator = { fg = palette.line },

				Normal = {
					fg = palette.base05,
					bg = "#000000",
					-- bg = palette.base00,
				},

				Bold = {
					bold = true,
				},

				Debug = {
					fg = palette.base08,
				},

				Directory = {
					fg = palette.base0D,
				},

				Error = {
					fg = palette.base00,
					bg = palette.base08,
				},

				ErrorMsg = {
					fg = palette.base08,
					bg = palette.base00,
				},

				Exception = {
					fg = palette.base08,
				},

				FoldColumn = {
					fg = palette.base0C,
					bg = palette.base01,
				},

				Folded = {
					fg = palette.light_grey,
					bg = palette.black2,
				},

				IncSearch = {
					fg = palette.base01,
					bg = palette.base09,
				},

				Italic = {
					italic = true,
				},

				Macro = {
					fg = palette.base08,
				},

				ModeMsg = {
					fg = palette.base0B,
				},

				MoreMsg = {
					fg = palette.base0B,
				},

				Question = {
					fg = palette.base0D,
				},

				Search = {
					fg = palette.base01,
					bg = palette.base0A,
				},

				Substitute = {
					fg = palette.base01,
					bg = palette.base0A,
					sp = "none",
				},

				SpecialKey = {
					fg = palette.base03,
				},

				TooLong = {
					fg = palette.base08,
				},

				UnderLined = {
					underline = true,
				},

				Visual = {
					bg = palette.base02,
				},

				VisualNOS = {
					fg = palette.base08,
				},

				WarningMsg = {
					fg = palette.base08,
				},

				WildMenu = {
					fg = palette.base08,
					bg = palette.base0A,
				},

				Title = {
					fg = palette.base0D,
					sp = "none",
				},

				Conceal = {
					bg = "NONE",
				},

				Cursor = {
					fg = palette.base00,
					bg = palette.base05,
				},

				NonText = {
					fg = palette.base03,
				},

				SignColumn = {
					fg = palette.base03,
					sp = "NONE",
				},

				ColorColumn = {
					bg = palette.base01,
					sp = "none",
				},

				CursorColumn = {
					bg = palette.base01,
					sp = "none",
				},

				CursorLine = {
					bg = "none",
					sp = "none",
				},

				QuickFixLine = {
					bg = palette.base01,
					sp = "none",
				},

				-- spell
				SpellBad = {
					undercurl = true,
					sp = palette.base08,
				},

				SpellLocal = {
					undercurl = true,
					sp = palette.base0C,
				},

				SpellCap = {
					undercurl = true,
					sp = palette.base0D,
				},

				SpellRare = {
					undercurl = true,
					sp = palette.base0E,
				},

				healthSuccess = {
					bg = palette.green,
					fg = palette.black,
				},

				-- lazy.nvim
				LazyH1 = {
					bg = palette.green,
					fg = palette.black,
				},

				LazyH2 = {
					fg = palette.red,
					bold = true,
					underline = true,
				},

				LazyReasonPlugin = { fg = palette.red },
				LazyValue = { fg = palette.teal },
				LazyDir = { fg = palette.base05 },
				LazyUrl = { fg = palette.base05 },
				LazyCommit = { fg = palette.green },
				LazyNoCond = { fg = palette.red },
				LazySpecial = { fg = palette.blue },
				LazyReasonFt = { fg = palette.purple },
				LazyOperator = { fg = palette.white },
				LazyReasonKeys = { fg = palette.teal },
				LazyTaskOutput = { fg = palette.white },
				LazyCommitIssue = { fg = palette.pink },
				LazyReasonEvent = { fg = palette.yellow },
				LazyReasonStart = { fg = palette.white },
				LazyReasonRuntime = { fg = palette.nord_blue },
				LazyReasonCmd = { fg = palette.sun },
				LazyReasonSource = { fg = palette.cyan },
				LazyReasonImport = { fg = palette.white },
				LazyProgressDone = { fg = palette.green },

				CmpItemKindConstant = { fg = palette.base09 },
				CmpItemKindFunction = { fg = palette.base0D },
				CmpItemKindIdentifier = { fg = palette.base08 },
				CmpItemKindField = { fg = palette.base08 },
				CmpItemKindVariable = { fg = palette.base0E },
				CmpItemKindSnippet = { fg = palette.red },
				CmpItemKindText = { fg = palette.base0B },
				CmpItemKindStructure = { fg = palette.base0E },
				CmpItemKindType = { fg = palette.base0A },
				CmpItemKindKeyword = { fg = palette.base07 },
				CmpItemKindMethod = { fg = palette.base0D },
				CmpItemKindConstructor = { fg = palette.blue },
				CmpItemKindFolder = { fg = palette.base07 },
				CmpItemKindModule = { fg = palette.base0A },
				CmpItemKindProperty = { fg = palette.base08 },
				CmpItemKindEnum = { fg = palette.blue },
				CmpItemKindUnit = { fg = palette.base0E },
				CmpItemKindClass = { fg = palette.teal },
				CmpItemKindFile = { fg = palette.base07 },
				CmpItemKindInterface = { fg = palette.green },
				CmpItemKindColor = { fg = palette.white },
				CmpItemKindReference = { fg = palette.base05 },
				CmpItemKindEnumMember = { fg = palette.purple },
				CmpItemKindStruct = { fg = palette.base0E },
				CmpItemKindValue = { fg = palette.cyan },
				CmpItemKindEvent = { fg = palette.yellow },
				CmpItemKindOperator = { fg = palette.base05 },
				CmpItemKindTypeParameter = { fg = palette.base08 },
				CmpItemKindCopilot = { fg = palette.green },
				CmpItemKindCodeium = { fg = palette.vibrant_green },
				CmpItemKindTabNine = { fg = palette.baby_pink },
			}
		end,
	},
	config = function(_, opts)
		require("kanagawa").setup(opts)

		vim.cmd([[
      autocmd VimEnter * hi DiffAdd guifg=#00FF00 guibg=#005500
      autocmd VimEnter * hi DiffDelete guifg=#FF0000 guibg=#550000
      autocmd VimEnter * hi DiffChange guifg=#CCCCCC guibg=#555555
      autocmd VimEnter * hi DiffText guifg=#00FF00 guibg=#005500
      ]])
	end,
}
