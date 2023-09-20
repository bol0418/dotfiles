local cmp = require("cmp")
require("cmp").setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    window = {
        completion = cmp.config.window.bordered({
            border = 'single'
        }),
        documentation = cmp.config.window.bordered({
            border = 'single'
        })
    },
    sources = cmp.config.sources({{
        name = "vsnip"
    }, {
        name = "nvim_lsp"
    }, {
        name = "path"
    }, {
        name = "buffer",
        keyword_length = 2
    }, {
        name = "latex_symbols"
    }, {
        name = "emoji"
    }}),
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-l>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }
    })
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers {function(server_name)
    lspconfig[server_name].setup {
        capabilities = capabilities
    }
end}
