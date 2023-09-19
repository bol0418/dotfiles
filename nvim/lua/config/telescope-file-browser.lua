require("telescope").setup({
    file_browser = {
        theme = "ivy"
    }
})

require("telescope").load_extension "file_browser"

vim.api.nvim_set_keymap("n", "<leader>ft", ":Telescope file_browser<CR>", {
    noremap = true
})
