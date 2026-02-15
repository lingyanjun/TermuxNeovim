return {
  "michaelb/sniprun",
  branch = "master",
  build = "bash install.sh 1",
  config = function()
    local sniprun = require("sniprun")
    
    -- 🎨 自定义高亮
    vim.api.nvim_set_hl(0, "SniprunVirtualTextOk", { fg = "#98c379", bold = true })
    vim.api.nvim_set_hl(0, "SniprunVirtualTextErr", { fg = "#e06c75", italic = true })

    sniprun.setup({
      -- ⚡️ 显示配置
      display = {
        "Classic",
        "VirtualTextOk", 
        "VirtualTextErr",  
        "Terminal",
      },
      
      -- 🎯 显示选项
      display_options = {
        terminal_width = 60,
        terminal_border = "rounded",
        terminal_title = "🚀 SnipRun",
        notification_timeout = 5,
      },
      interpreter_options = {
        Cpp_original = {
          compiler = "clang++ -g --std=c++17",
        },
      },
    })
    local map = vim.keymap.set
    map('n', '<leader>r', function() 
      require("sniprun").run() 
    end, { desc = "运行单行代码" })
  end
}
