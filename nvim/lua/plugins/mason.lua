return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { }
	},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			}
		},
		{
	        "WhoIsSethDaniel/mason-tool-installer.nvim",
	         opts = {
		         ensure_installed = {},
		         auto_update = false,
		         run_on_start = false,
	         }
        },
		{
			"neovim/nvim-lspconfig",
			event = { "BufReadPre", "BufNewFile" },
		}
	},
}
