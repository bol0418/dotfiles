-- windows split
vim.keymap.set('n', 'ss', ':split<Return><C-w>w')
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move Active Window
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sl', '<C-w>l')

-- ESC by jj
vim.keymap.set('i', 'jj', '<Esc>')

_noremap = {
    noremap = true
}
vim.api.nvim_set_keymap('n', 'j', 'gj', _noremap)
vim.api.nvim_set_keymap('n', 'k', 'gk', _noremap)
vim.api.nvim_set_keymap('n', '<Down>', 'gj', _noremap)
vim.api.nvim_set_keymap('n', '<Up>', 'gk', _noremap)
vim.api.nvim_set_keymap('n', 'gj', 'j', _noremap)
vim.api.nvim_set_keymap('n', 'gk', 'k', _noremap)
