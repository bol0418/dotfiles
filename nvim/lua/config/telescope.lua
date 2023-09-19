require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
        layout_config = {},
        preview = {
            treesitter = false
        },
        mappings = {
            i = {
                ['<esc>'] = require('telescope.actions').close,
                ['<C-u>'] = false
            }
        },
        file_ignore_patterns = {"^.git/", "^.cache/"},
        vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column",
                             "--smart-case", "-hidden"},
        pickers = {
            find_files = {
                hidden = true
            },
            live_grep = {}
        }
    }
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})

vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
vim.keymap.set("n", "<leader>gl", builtin.git_commits, {})

vim.keymap.set("n", "<Leader>fn", ":Telescope find_files cwd=~/.config/nvim<CR>", {})
