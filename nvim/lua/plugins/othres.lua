return {
    {
        "windwp/nvim-autopairs",
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            require("Comment").setup({
                padding = true,
                sticky = true,
                ignore = nil,
            })
        end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
        config = function()
            local highlight = {
                "CursorColumn",
                "Whitespace",
            }
            require("ibl").setup({
                indent = { highlight = highlight, char = "" },
                whitespace = {
                    highlight = highlight,
                    remove_blankline_trail = false
                },
                scope = { enabled = false }
            })
        end
    },
}
