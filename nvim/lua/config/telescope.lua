require('telescope').setup({
    defaults = {
        layout_strategy = 'flex',
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
                             "--smart-case", "-uu"},
        pickers = {
            find_files = {
                hidden = true
            },
            live_grep = {}
        }
    }
})

local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>fk", builtin.keymaps, {
    desc = "Show keymaps"
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, {
    desc = "Telescope find files"
})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
    desc = "Telescope live grep"
})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {
    desc = "Telescope show buffers"
})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
    desc = "Telescope helps"
})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {
    desc = "Telescope recent files"
})

vim.keymap.set("n", "<leader>gs", builtin.git_status, {
    desc = "Telescope git status"
})
vim.keymap.set("n", "<leader>gl", builtin.git_commits, {
    desc = "Telescope git commits"
})

-- view nvim config directory
if vim.loop.os_uname().sysname == 'Windows_NT' then
    home = os.getenv "USERPROFILE"
else
    home = os.getenv "HOME"
end

local cmd = ":Telescope find_files cwd=" .. home .. "/.config/nvim<CR>"
vim.keymap.set('n', '<leader>fn', cmd, {
    desc = "Telescope show nvim files"
})
