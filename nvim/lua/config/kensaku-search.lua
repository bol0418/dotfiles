-- https://github.com/lambdalisue/kensaku-search.vim
vim.api.nvim_set_keymap('c', '<CR>', '<Plug>(kensaku-search-replace)<CR>', {
    noremap = true,
    silent = true
})
