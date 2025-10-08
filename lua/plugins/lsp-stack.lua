-- File: ~/.config/nvim/lua/plugins/lsp_control.lua

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      -- This ensures Mason installs the server executables
      require("mason").setup({})
      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup({
	      settings = {
		      workspace = {
		      checkThirdParty = false, -- Disable checking for third-party libraries for better performance
		      library = {
			-- The path to your Neovim config and the runtime files
			[vim.fn.expand("$VIMRUNTIME/lua")] = true,
			[vim.fn.stdpath("config") .. "/lua"] = true,
		      },
		    },
		     diagnostics = {
		      globals = { "vim" },
		    },
	    }
      })

lspconfig.rust_analyzer.setup({
      settings = {
        ['rust-analyzer'] = {

          -- Enable inlay hints
          inlayHints = {
            enable = true,

            -- Shows type hints for variables
            typeHints = {
              enable = true,
              hideNamedConstructor = false,
            },

            -- Shows hints for chained method calls
            chainingHints = {
              enable = true,
            },
            
            -- Shows parameter name hints for function calls
            parameterHints = {
              enable = true,
            },

            closingBraceHints = {
              enable = true,
              minLines = 1, -- Only show for blocks longer than 1 line
            },
          },
          -- Other useful settings
          check = {
            command = "clippy",
          },
        },
      },
      on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap. set('n', 'K', vim.lsp.buf.hover, opts)
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
end,
})
      lspconfig.pyright.setup({})
	  lspconfig.gopls.setup({})
      lspconfig.terraformls.setup({})
      lspconfig.texlab.setup({})
	  lspconfig.clangd.setup({})
	  lspconfig.lua_ls.setup({})
	  lspconfig.ts_ls.setup({})
    end,
  },
	require("flutter-tools").setup {} -- use defaults
}
