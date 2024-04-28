return { {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll",
        "MasonLog", "MasonUpdate" },
    dependencies = { "mason-org/mason-registry", "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim", "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp" },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup_handlers({ function(server)
            local opts = {
                capabilities = require("cmp_nvim_lsp").default_capabilities(
                    vim.lsp.protocol.make_client_capabilities())
            }
            local lspconfig = require("lspconfig")
            lspconfig[server].setup(opts)
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })
        end })
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format {
                async = true
            }
        end, { noremap = true })
    end
}, {
    "nvimtools/none-ls.nvim",
    event = { "VeryLazy" },
    dependencies = { "nvim-lua/plenary.nvim", {
        "jay-babu/mason-null-ls.nvim",
        dependencies = { "mason.nvim" }
    } },
    config = function()
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local null_ls = require("null-ls")
        -- luaformatter
        local luaformatter_path = vim.fn.glob(
            vim.fn.stdpath("data") .. "/mason/bin/lua-format")
        local luaformatter = {
            method = null_ls.methods.FORMATTING,
            filetypes = { "lua" },
            generator = {
                fn = function()
                    return {
                        command = luaformatter_path,
                        args = { "--indent-type=Spaces", "--indent-width=4",
                            "--column-limit=80" },
                        to_stdin = true
                    }
                end
            }
        }

        null_ls.setup({
            sources = { luaformatter },
            diagnostics_format = "#{m} (#{s}: #{c})",
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                async = false
                            })
                        end
                    })
                end
            end
        })
        require("mason-null-ls").setup({
            automatic_setup = true,
            handlers = {}
        })
    end
}, {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require("lspsaga").setup({})
    end
}, {
    "j-hui/fidget.nvim",
    config = function()
        require("fidget").setup()
    end
}, {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
}
}
