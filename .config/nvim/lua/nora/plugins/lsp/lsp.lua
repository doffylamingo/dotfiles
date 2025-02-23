return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("fidget").setup({})
		local cmp = require("cmp")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local opts = { noremap = true, silent = true }
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")

		local function get_python_path()
			local venv_path = os.getenv("VIRTUAL_ENV")
			if venv_path then
				return venv_path .. "/bin/python3"
			else
				return "/usr/bin/python3"
			end
		end

		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"bashls",
				"lua_ls",
				"rust_analyzer",
				"gopls",
				"html",
				"cssls",
				"emmet_language_server",
				"tailwindcss",
				"ts_ls",
				"pylsp",
				"clangd",
				"prismals",
				"yamlls",
				"jsonls",
				"eslint",
				"zls",
				"marksman",
				"sqlls",
			},
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
						handlers = {
							["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
							["textDocument/signatureHelp"] = vim.lsp.with(
								vim.lsp.handlers.signature_help,
								{ border = "rounded" }
							),
						},
					})
				end,
				-- ["lua_ls"] = function()
				--     lspconfig.lua_ls.setup({
				--         on_attach = on_attach,
				--         capabilities = capabilities,
				--         settings = {
				--             Lua = {
				--                 diagnostics = {
				--                     globals = { "vim", "it", "describe", "before_each", "after_each" },
				--                 },
				--             },
				--             workspace = {
				--                 library = {
				--                     [vim.fn.expand("$VIMRUNTIME/lua")] = true,
				--                     [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				--                     [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
				--                 },
				--                 maxPreload = 100000,
				--                 preloadFileSize = 10000,
				--             },
				--         },
				--     })
				-- end,
				["gopls"] = function()
					lspconfig.gopls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						cmd = { "gopls" },
						filetypes = { "go", "gomod", "gowork", "gotmpl" },
						root_dir = util.root_pattern("go.work", "go.mod", ".git"),
						settings = {
							gopls = {
								completeUnimported = true,
								usePlaceholders = true,
								analyses = {
									unusedparams = true,
								},
							},
						},
					})
				end,
				["ts_ls"] = function()
					lspconfig.ts_ls.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						root_dir = util.root_pattern("package.json"),
						single_file_support = false,
						init_options = {
							preferences = {
								disableSuggestions = true,
							},
						},
					})
				end,
				["html"] = function()
					lspconfig.html.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						filetypes = {
							"html",
							"css",
							"javascriptreact",
							"typescriptreact",
							"javascript",
							"typescript",
							"jsx",
							"tsx",
						},
					})
				end,
				["emmet_language_server"] = function()
					lspconfig.emmet_language_server.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						filetypes = {
							"html",
							"css",
							"javascriptreact",
							"typescriptreact",
							"javascript",
							"typescript",
							"jsx",
							"tsx",
						},
					})
				end,
				["tailwindcss"] = function()
					lspconfig.tailwindcss.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						filetypes = {
							"html",
							"css",
							"javascriptreact",
							"typescriptreact",
							"javascript",
							"typescript",
							"jsx",
							"tsx",
						},
					})
				end,
				["clangd"] = function()
					lspconfig.clangd.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						cmd = {
							"clangd",
							"--background-index",
							"--pch-storage=memory",
							"--all-scopes-completion",
							"--pretty",
							"--header-insertion=never",
							"-j=4",
							"--inlay-hints",
							"--header-insertion-decorators",
							"--function-arg-placeholders",
							"--completion-style=detailed",
						},
						filetypes = { "c", "cpp", "objc", "objcpp" },
						root_dir = require("lspconfig").util.root_pattern("src"),
						init_option = { fallbackFlags = { "-std=c++2a" } },
						single_file_support = true,
					})
				end,
				["pylsp"] = function()
					lspconfig.pylsp.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							python = {
								pythonPath = get_python_path(),
							},
						},
					})
				end,
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettierd",
				"stylua",
				"isort",
				"black",
				"pylint",
				"eslint_d",
				"gofumpt",
				"golines",
				"goimports-reviser",
				"clang-format",
				"yamlfmt",
			},
		})

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local luasnip = require("luasnip")

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		local function border(hl_name)
			return {
				{ "╭", hl_name },
				{ "─", hl_name },
				{ "╮", hl_name },
				{ "│", hl_name },
				{ "╯", hl_name },
				{ "─", hl_name },
				{ "╰", hl_name },
				{ "│", hl_name },
			}
		end

		local kind_icons = {
			Text = "",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰂡",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
		}

		cmp.setup({
			formatting = {
				format = function(entry, vim_item)
					-- Kind icons
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
					-- Source
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						luasnip = "[LuaSnip]",
						nvim_lua = "[Lua]",
						latex_symbols = "[LaTeX]",
					})[entry.source.name]
					return vim_item
				end,
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				completeopt = "menu,menuone,noselect",
			},
			preselect = cmp.PreselectMode.None,
			window = {
				completion = {
					border = border("CmpPmenu"),
					winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel",
					scrollbar = false,
				},
				documentation = {
					border = border("CmpDocBorder"),
					winhighlight = "Normal:CmpDoc",
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-g>"] = cmp.mapping.scroll_docs(-4), -- scroll backward
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				["<C-Space>"] = cmp.mapping.complete(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "lazydev", group_index = 0 },
				{ name = "nvim_lua" },
				{ name = "path" },
			}),
			experimental = { ghost_text = true },
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
