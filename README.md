# nvim
- 自动补全括号
- 缓冲区显示
- 代码提示
- 保存自动格式化
- 底部状态栏
- 文件树
- leetcode
- 光标动画
- lsp定义等快捷键
- C/C++调试器
- 启动界面美化
- 快速编译运行C/Cpp
- 代码折叠
- lsp
    1. c & cpp
    2. lua
- 快速运行C/Cpp代码片段
- c/cpp单元测试


使用教程：

前置命令：    
需要额外在你的termux安装clang，lua-language-server,gdb,,rust,git,nodejs,wget,leetcode-cli,which,tree,make,cmake,python-pip,python(国内用户建议切换清华源)

命令如下: 

pkg install python clang lua-language-server gdb rust git nodejs wget which tree make cmake python-pip -y

npm install -g leetcode-cli

安装命令:

mkdir ~/.config/

mkdir ～/.config/nvim/

wget https://github.com/lingyanjun/TermuxNeovim/archive/refs/heads/main.zip

unzip main.zip

cp -r TermuxNeovim-main/nvim ~/.config/

rm -rf main.zip TermuxNeovim-main

文件目录:
├── init.lua
├── .stylua.toml
└── lua
    ├── key-maps.lua
    └── plugins
        ├── alpha-nvim.rc.lua
        ├── autopair.lua
        ├── barbar.lua
        ├── blink.lua
        ├── clangd_extensions.lua
        ├── conform.lua
        ├── edgy.lua
        ├── leetcode.lua
        ├── lspconfig.lua
        ├── lualine.lua
        ├── markdown.lua
        ├── mason.lua
        ├── neoscroll.lua
        ├── noice.lua
        ├── nvim-dap.lua
        ├── nvim-tree.lua
        ├── nvim-ufo.lua
        ├── quick-c.lua
        ├── smear-cursor.lua
        ├── sniprun.lua
        ├── telescope.lua
        ├── theme.lua
        ├── toggleterm.lua
        ├── nvim-treesitter.lua
        ├── neotest.lua
        └── which-key.lua
        