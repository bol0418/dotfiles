_noremap = {
    noremap = true
}

-- set leader
vim.api.nvim_set_var('mapleader', ' ')

-- windows split
vim.api.nvim_set_keymap('n', 'ss', ':split<Return><C-w>w', _noremap)
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return><C-w>w', _noremap)

-- Move Active Window
vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', _noremap)
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', _noremap)
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', _noremap)
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', _noremap)

-- ESC by jj
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', _noremap)

vim.api.nvim_set_keymap('n', 'j', 'gj', _noremap)
vim.api.nvim_set_keymap('n', 'k', 'gk', _noremap)
vim.api.nvim_set_keymap('n', '<Down>', 'gj', _noremap)
vim.api.nvim_set_keymap('n', '<Up>', 'gk', _noremap)
vim.api.nvim_set_keymap('n', 'gj', 'j', _noremap)
vim.api.nvim_set_keymap('n', 'gk', 'k', _noremap)
