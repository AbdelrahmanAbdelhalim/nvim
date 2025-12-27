return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"nvim-tree/nvim-web-devicons",
			-- No new dependencies added
		},
		config = function()
			require("mason").setup({})

			-- 1. Use the new global config to link your existing blink.cmp
			-- This is the "correct" way to fix completion without the old .setup()
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
					},
				},
			})
			vim.lsp.enable("lua_ls")

			-- 3. Jedi Configuration (Fixing the Pandas/Torch path)
			vim.lsp.config("jedi_language_server", {
				init_options = {
					workspace = {
						-- Fixed: Absolute path expansion for your venv
						environmentPath = vim.fn.expand("~/dev/jupyter_setup/molten/bin/python"),
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
				end,
			})
		end,
	},
}
