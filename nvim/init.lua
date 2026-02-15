local opt = vim.opt
local api = vim.api
local g = vim.g

-- 全局缩进设置
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.cindent = true
opt.number = true
opt.relativenumber = false
opt.termguicolors = true
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldenable = false
opt.wrap = false
-- 强力关闭自动注释
api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions = "jql"
    end,
    nested = true,
})
api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o", "c" })
    end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
opt.rtp:prepend(lazypath)

g.barbar_auto_setup = false
-- 设置剪贴板使用 Termux API
opt.clipboard = "unnamedplus"
g.clipboard = {
    name = "termux-clipboard",
    copy = {
        ["+"] = "termux-clipboard-set",
        ["*"] = "termux-clipboard-set",
    },
    paste = {
        ["+"] = "termux-clipboard-get",
        ["*"] = "termux-clipboard-get",
    },
    cache_enabled = 0,
}

opt.guicursor = {
    "i:ver25",
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
}

require("key-maps")
require("lazy").setup("plugins")

vim.cmd("colorscheme catppuccin")
