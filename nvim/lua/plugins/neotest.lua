return {
    "nvim-neotest/neotest",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "alfaix/neotest-gtest", -- C++ Google Test
    },
    config = function()
        require("neotest").setup({
            adapters = {
                ["neotest-gtest"] = {},
            },
        })
    end,
}
