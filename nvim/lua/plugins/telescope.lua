if not vim.g.vscode then
    return { {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {
                desc = "Find files using Telescope"
            })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
                desc = "Live grep using Telescope"
            })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, {
                desc = "List open buffers using Telescope"
            })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
                desc = "Search help tags using Telescope"
            })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, {
                desc = "Show keymaps using Telescope"
            })
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {
                desc = "Open recently opened files using Telescope"
            })

            local actions = require("telescope.actions")
            require("telescope").setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<esc>"] = actions.close
                        },
                        n = {
                            ["j"] = actions.move_selection_next,
                            ["k"] = actions.move_selection_previous
                        }
                    }
                }
            }
        end
    }, {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            -- file browser
            vim.keymap.set("n", "<space>fd", ":Telescope file_browser<cr>", {
                noremap = true,
                desc = "Open file browser using Telescope"
            })
        end
    }, {
        "nvim-telescope/telescope-ui-select.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    } }
else
    return {}
end
