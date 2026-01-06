return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("mason").setup({})

			-- 1. Use the new global config to link your existing blink.cmp
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			vim.lsp.config("*", { capabilities = capabilities })

			-- 2. lua_ls Configuration
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
						diagnostics = { globals = { "vim" } },
						hint = {
							enable = true,
							semicolon = "Disable",
						},
						codeLens = {
							enable = true,
						},
					},
				},
			})
			vim.lsp.enable("lua_ls")

			-- 3. Jedi Configuration (Enhanced for Pandas/Torch autocomplete)
			vim.lsp.config("jedi_language_server", {
				init_options = {
					workspace = {
						environmentPath = vim.fn.expand("/Users/screbz/dev/jupyter_setup/molten/bin/python"),
					},
				},
				settings = {
					jedi = {
						enable = true,
						startupMessage = true,
						workspace = {
							extraPaths = {},
							symbols = {
								maxSymbols = -1,
							},
						},
						completion = {
							disableSnippets = false,
							resolveEagerly = true,
						},
					},
				},
			})
			vim.lsp.enable("jedi_language_server")

			-- 4. Bulk enable remaining servers
			local servers_to_enable = {
				"gopls",
				"terraformls",
				"texlab",
				"clangd",
				"zls",
				"vtsls",
			}
			for _, server in ipairs(servers_to_enable) do
				vim.lsp.enable(server)
			end

			-- 5. Global LSP Keybindings (Modern LspAttach way)
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP keybindings and configuration",
				callback = function(args)
					local opts = { buffer = args.buf, noremap = true, silent = true }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
}
