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

      lspconfig.pyright.setup({})
	  lspconfig.gopls.setup({})
      lspconfig.terraformls.setup({})
      lspconfig.texlab.setup({})
	  lspconfig.clangd.setup({})
	  lspconfig.lua_ls.setup({})
    end,
  },
	require("flutter-tools").setup {} -- use defaults
}
