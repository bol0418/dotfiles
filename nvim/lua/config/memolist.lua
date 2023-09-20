home = os.getenv "HOME"
vim.g.memolist_path = home .. "/memo"
vim.g.memolist_memo_suffix = "md"
vim.g.memolist_template_dir_path = home .. "/.config/memo/templates"
vim.g.memolist_fzf = 1

-- keymapks
vim.api.nvim_set_keymap('n', '<leader>mn', '<cmd>MemoNew<cr>', {
    desc = "Create a new memo"
})
vim.api.nvim_set_keymap('n', '<leader>ml', '<cmd>Telescope find_files cwd=' .. home .. '/memo' .. '<cr>', {
    desc = "List memo"
})
vim.api.nvim_set_keymap('n', '<leader>mg', '<cmd>Telescope live_grep cwd=' .. home .. '/memo' .. '<cr>', {
    desc = "Grep memo"
})
