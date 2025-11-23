return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			python = { "isort", "black" },
			javascript = { "prettierd", "prettier" },
			tex = { "latexindent" },
			html = { "prettier" },
			sql = { "sqlfluff_mysql" },
		},
		formatters = {
			sqlfluff_mysql = {
				command = "sqlfluff",
				args = { "fix", "--dialect", "mysql", "-" },
				stdin = true,
				cwd = nil,
				require_cwd = false,
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
