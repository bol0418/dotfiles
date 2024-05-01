if not vim.g.vscode then
    return {
        {
            "maxmx03/solarized.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.o.background = "dark"
                vim.cmd.colorscheme("solarized")
            end,
        },
    }
else
    return {}
end
