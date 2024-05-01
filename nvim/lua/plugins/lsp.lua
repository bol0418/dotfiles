return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },
        dependencies = {
            "mason-org/mason-registry",
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            local servers = {
                "bashls",
                "clangd",
                "cmake",
                "cssls",
                "docker_compose_language_service",
                "dockerls",
                "html",
                "jsonls",
                "lua_ls",
                "marksman",
                "ruff_lsp",
                "tsserver",
            }

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_installation = true,
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local function setup_server(server, config)
                config.capabilities = capabilities
                if server == "lua_ls" then
                    config.settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    }
                end
                lspconfig[server].setup(config)
            end

            for _, server in pairs(servers) do
                setup_server(server, {})
            end

            -- format keymap
            vim.keymap.set("n", "<space>fm", function()
                vim.lsp.buf.format({
                    async = true,
                })
            end, { noremap = true, desc = "Format current buffer" })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    "diagnosticls",
                    "eslint",
                    "markdownlint",
                    "prettier",
                    "ruff",
                    "shellcheck",
                    "sqlfluff",
                    "stylelint",
                    "stylua",
                    "yamllint",
                },
                automatic_installation = true,
                automatic_setup = true,
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        event = { "VeryLazy" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "jay-babu/mason-null-ls.nvim",
                dependencies = { "mason.nvim" },
            },
        },
        config = function()
            local null_ls = require("null-ls")
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            local lsp_formatting = function(bufnr)
                vim.lsp.buf.format({
                    filter = function(client)
                        return client.name == "null-ls"
                    end,
                    bufnr = bufnr,
                })
            end

            local function find_markdownlint_config()
                local config_files = {
                    ".markdownlint.json",
                    "config/.markdownlint.json",
                    vim.fn.expand("~/.config/.markdownlint.json"),
                    vim.fn.expand("~/.markdownlint.json"),
                }

                for _, file in ipairs(config_files) do
                    if vim.fn.filereadable(file) == 1 then
                        return file
                    end
                end

                return nil
            end

            local function get_markdownlint_config()
                local config_file = find_markdownlint_config()
                if config_file then
                    return { "--config", config_file }
                end
                return {}
            end

            local markdownlint_config = get_markdownlint_config()


            local source_settings = {
                null_ls.builtins.diagnostics.markdownlint.with({
                    extra_args = markdownlint_config,
                }),
                null_ls.builtins.formatting.markdownlint.with({
                    extra_args = markdownlint_config,
                }),
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                        "css",
                        "scss",
                        "less",
                        "html",
                        "json",
                        "jsonc",
                        "yaml",
                        "graphql",
                        "handlebars",
                    }
                }) }

            null_ls.setup({
                sources = source_settings,

                -- save on format
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                -- vim.lsp.buf.formatting_sync()
                                -- vim.lsp.buf.formatting({ bufnr = bufnr })
                                lsp_formatting(bufnr)
                            end,
                        })
                    end
                end,
            })
        end
    },
    -- {
    --     "nvimdev/lspsaga.nvim",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter",
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     config = function()
    --         require("lspsaga").setup({})
    --     end,
    -- },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({})
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts)
            require("lsp_signature").setup(opts)
        end,
    },
    {
        "mzlogin/vim-markdown-toc",
        config = function()
            vim.g.vmt_auto_update_on_save = 1
            vim.g.vmt_dont_insert_fence = 1
            vim.g.vmt_list_item_char = "-"
            vim.g.vmt_max_level = 3
        end
    },
}
