return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                ensure_installed = "all",
                markdown = {
                    config = {
                        indent = { enable = true, indent_width = 4 },
                    },
                },
            })
        end,
    },
}
