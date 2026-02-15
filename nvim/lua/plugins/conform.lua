return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        formatters = {
            ["clang-format"] = {
                prepend_args = {
                    "--style={BasedOnStyle: Google, IndentWidth: 4, ColumnLimit: 0}",
                },
            },
        },
    },
}

