return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	ft = { "rust" },
	opts = {
		-- This 'inlay_hints' key is specific to rustaceanvim
		inlay_hints = {
			auto = true,
		},

		-- Your 'server' block
		server = {
			settings = {
				["rust-analyzer"] = {
					inlayHints = {
						enable = true,
						typeHints = {
							enable = true,
							hideNamedConstructor = false,
						},
						chainingHints = {
							enable = true,
						},
						parameterHints = {
							enable = true,
						},
						closingBraceHints = {
							enable = true,
							minLines = 1,
						},
					},
					check = {
						command = "clippy",
					},
				},
			},
			on_attach = function(client, bufnr)
				local opts = { buffer = bufnr, noremap = true, silent = true }
				vim.keymap.set("n", "<leader>d", vim.lsp.buf.hover, opts)
				vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			end,
		},
	},

	-- THIS IS THE FIX:
	-- This function takes the 'opts' table above and assigns it
	-- to the global variable that rustaceanvim reads for config.
	config = function(_, opts)
		vim.g.rustaceanvim = vim.tbl_deep_extend("force", {}, opts)
	end,
}
