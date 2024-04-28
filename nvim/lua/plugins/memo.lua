if not vim.g.vscode then
    return {{
        "glidenote/memolist.vim",
        config = function()
            vim.cmd [[
            let g:memolist_fzf = 1
            let g:memolist_memo_date = "%Y-%m-%d"
            let g:memolist_memo_suffix = "md"
            let g:memolist_path = $HOME."/memos"
            let g:memolist_template_dir_path = "~/.config/memo/templates"
        ]]

            local opts = {
                noremap = true,
                silent = true
            }
            vim.keymap.set("n", "<Leader>mn", ":MemoNew<CR>", {
                noremap = true,
                silent = true,
                desc = "Create a new memo"
            })
            -- vim.keymap.set("n", "<Leader>ml", ":MemoList<CR>", {
            --     noremap = true,
            --     silent = true,
            --     desc = "List memos"
            -- })
            -- vim.keymap.set("n", "<Leader>mg", ":MemoGrep<CR>", {
            --     noremap = true,
            --     silent = true,
            --     desc = "Grep memos"
            -- })
        end
    }, {
        "delphinus/telescope-memo.nvim",
        dependencies = {"nvim-telescope/telescope.nvim"},
        config = function()
            require("telescope").load_extension("memo")

            local opts = {
                noremap = true,
                silent = true
            }
            vim.keymap.set("n", "<Leader>ml", ":Telescope memo list<CR>", opts,
                {
                    desc = "List memos using Telescope"
                })
            vim.keymap.set("n", "<Leader>mg", ":Telescope memo live_grep<CR>",
                opts, {
                    desc = "Live grep memos using Telescope"
                })
        end
    }}
else
    return {}
end
