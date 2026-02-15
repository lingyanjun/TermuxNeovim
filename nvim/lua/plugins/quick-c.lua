return {
    "AuroBreeze/quick-c",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    event = "VeryLazy",
    ft = { "c", "cpp" },
    keys = {
        { "<leader>cqb", desc = "Quick-c: Build" },
        { "<leader>cqr", desc = "Quick-c: Run" },
        { "<leader>cqR", desc = "Quick-c: Build & Run" },
        { "<leader>cqM", desc = "Quick-c: Make targets (Telescope)" },
        { "<leader>cqS", desc = "Quick-c: Select sources (Telescope)" },
        { "<leader>cqf", desc = "Quick-c: Open quickfix (Telescope)" },
    },
    cmd = {
        "QuickCBuild", "QuickCRun", "QuickCBR", "QuickCDebug",
        "QuickCMake", "QuickCMakeRun", "QuickCMakeCmd",
        "QuickCCompileDB", "QuickCCompileDBGen", "QuickCCompileDBUse",
        "QuickCQuickfix", "QuickCCheck",
    },
    config = function()
        require("quick-c").setup({ })
    end,
}
