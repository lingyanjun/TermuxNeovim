return {
	vim.lsp.enable('clangd'),
	vim.lsp.enable('lua-language-server'),
	vim.lsp.config('clangd', {
		cmd = { "/data/data/com.termux/files/usr/bin/clangd" },
		filetypes = { "c", "cpp", "objc", "objcpp" },
		settings = {
			cpp = {
				analysis = {
					diagnosticMode = 'workspace',
					autoSearchPaths = true,
					useLibraryCodeForTypes = true
				}
			},
			c = {
				analysis = {
					diagnosticMode = 'workspace',
					autoSearchPaths = true,
					useLibraryCodeForTypes = true
				}
			}
		}
	}),

	vim.lsp.config('lua-language-server', {
    cmd = {
        "/data/data/com.termux/files/usr/bin/lua-language-server",
        "-E", 
        "/data/data/com.termux/files/usr/share/lua-language-server/main.lua"
    },
    filetypes = { "lua" },
    single_file_support = true,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = {
                    '?.lua',
                    '?/init.lua',
                    vim.fn.expand('~/.config/nvim/lua/?.lua'), 
                    vim.fn.expand('~/.config/nvim/lua/?/init.lua'),
                    vim.fn.expand('~/.luarocks/share/lua/5.1/?.lua'),
                    vim.fn.expand('~/.luarocks/share/lua/5.1/?/init.lua'),
                    '/data/data/com.termux/files/usr/share/lua/5.1/?.lua', 
                    '/data/data/com.termux/files/usr/share/lua/5.1/?/init.lua'
                }
            },
            diagnostics = {
                globals = { 'vim' }, 
                disable = { "different-requires" }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                library = vim.list_extend(
                    vim.api.nvim_get_runtime_file("", true),
                    {
                        vim.fn.expand("~/.local/share/nvim/*"),
                        vim.fn.expand("~/.config/nvim/lua")
                    }
                ),

                maxPreload = 1000,      
                preloadFileSize = 500,  
                checkThirdParty = false 
            },
            telemetry = {
                enable = false 
            },
            completion = {
                enable = true,
                callSnippet = "Both"
            },
            hint = {
                enable = true 
            }
        }
    },
    init_options = {
        documentFormatting = true, 
        hover = true,
        documentSymbol = true
    }
    })
}
