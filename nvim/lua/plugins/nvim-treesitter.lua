return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter")
        treesitter.setup({
            -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
            install_dir = vim.fn.stdpath("data") .. "/site",
        })
        indent =
            {
                enable = false, -- 禁用 treesitter 缩进
            }, treesitter.install({ "cpp", "c", "lua" })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "cpp", "c", "lua" },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
