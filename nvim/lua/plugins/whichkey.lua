if not vim.g.vscode then
    return {
        {
            "folke/which-key.nvim",
            lazy = true,
            cmd = { "WhichKey" },
            opts = {},
        },
    }
else
    return {}
end
