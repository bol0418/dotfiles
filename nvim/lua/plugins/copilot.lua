if not vim.g.vscode then
    return {
        -- "github/copilot.vim",
        -- lazy = false,
        -- event = { "BufReadPre", "BufNewFile" },
        -- filetypes = {
        --     markdown = true,
        --     help = true
        -- },
    }

else
    return {}
end
