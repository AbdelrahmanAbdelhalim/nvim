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
			-- 4. Server-specific configuration
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						semanticTokens = true,
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			})

			vim.lsp.config("texlab", {
				settings = {
					texlab = {
						diagnostics = {
							ignoredPatterns = {
								"marginparwidth",
								"Overfull",
							},
						},
					},
				},
			})

			vim.lsp.config("basedpyright", {
				settings = {
					basedpyright = {
						analysis = {
							typeCheckingMode = "basic",
							diagnosticMode = "openFilesOnly",
							inlayHints = { callArgumentsName = true, variableTypes = true },
						},
					},
				},
			})

			-- Enable servers only after all of their configuration is registered.
			local servers_to_enable = {
				"lua_ls",
				"jedi_language_server",
				"gopls",
				"terraformls",
				"texlab",
				"clangd",
				"zls",
				"vtsls",
				"basedpyright",
			}
			for _, server in ipairs(servers_to_enable) do
				vim.lsp.enable(server)
			end

			-- 6. Global LSP Keybindings (Modern LspAttach way)
			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP keybindings and configuration",
				callback = function(args)
					local opts = { buffer = args.buf, noremap = true, silent = true }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if client and client.supports_method("textDocument/inlayHint") then
						vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
					end
				end,
			})
		end,
	},
}
