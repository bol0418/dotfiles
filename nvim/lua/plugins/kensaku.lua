if not vim.g.vscode then
    -- Firstly, install the latest Deno.
    return {
        {
            "lambdalisue/kensaku.vim",
            dependencies = { "vim-denops/denops.vim" },
        },
        {
            "lambdalisue/kensaku-command.vim",
            dependencies = { "lambdalisue/kensaku.vim" },
        },
        {
            "lambdalisue/kensaku-search.vim",
            dependencies = { "lambdalisue/kensaku.vim" },
            config = function()
                vim.keymap.set("c", "<CR>", "<Plug>(kensaku-search-replace)<CR>", {
                    desc = "Search and replace using Kensaku",
                })
            end,
        },
        {
            "Allianaab2m/telescope-kensaku.nvim",
            dependencies = { "lambdalisue/kensaku.vim", "nvim-telescope/telescope.nvim" },
            config = function()
                require("telescope").load_extension("kensaku") -- :Telescope kensaku
            end,
        },
    }
else
    return {}
end
