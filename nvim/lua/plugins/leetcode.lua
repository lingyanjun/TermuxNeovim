return {
    "rainLyn/leetcode.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- 在插件加载前确保目录存在
        local leetcode = vim.fn.expand("~/CODE")
        local leetcode_home = vim.fn.expand("~/CODE/leetcode")
        local leetcode_cache = vim.fn.expand("~/CODE/leetcode/.cache")
        
        -- 递归创建目录（如果不存在）
        vim.fn.mkdir(leetcode, "p")
        vim.fn.mkdir(leetcode_home, "p")
        vim.fn.mkdir(leetcode_cache, "p")
        
        require("leetcode").setup({
            cn = {
                enabled = true,
                translator = true,
                translate_problems = true,
            },
            storage = {
                home = leetcode_home,
                cache = leetcode_cache,
            },
            injector = {
                ["cpp"] = {
                    imports = function()
                        return { 
                            "#include <stack>", 
                            "#include <queue>", 
                            "#include <vector>", 
                            "#include <string>",
                            "using namespace std;" 
                        }
                    end,
                },
            }
        })
    end
}
