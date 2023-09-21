-- https://github.com/williamboman/mason-lspconfig.nvim
require("mason-lspconfig").setup {
    ensure_installed = {"bashls", "biome", "lua_ls", "marksman", "powershell_es", "ruff_lsp", "sqlls", "taplo", "yamlls"}
}
