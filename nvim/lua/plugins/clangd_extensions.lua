return {
	"p00f/clangd_extensions.nvim",
	ft = { "c", "cpp" },
	config = function()
		require("clangd_extensions").setup({
			server = {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--fallback-style=llvm",
				},
				init_options = {
					usePlaceholders = true,
					completeUnimported = true,
					clangdFileStatus = true,
				},
			},
			extensions = {
				autoSetHints = true,
				inlay_hints = {
					inline = false,
					only_current_line = false,
					only_current_line_autocmd = "CursorHold",
					show_parameter_hints = true,
					parameter_hints_prefix = "<- ",
					other_hints_prefix = "=> ",
					max_len_align = false,
					max_len_align_padding = 1,
					right_align = false,
					right_align_padding = 7,
					highlight = "Comment",
				},
			},
		})
	end,
}