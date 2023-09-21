if vim.loop.os_uname().sysname == 'Windows_NT' then
    -- need ~/lib/sqlite3.dll
    -- Windows specific settings
    -- https://www.sqlite.org/download.html
    local home = os.getenv "HOME"
    vim.g.sqlite_clib_path = home .. "/lib/sqlite3.dll"
end

require("telescope").load_extension "frecency"

vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>Telescope frecency<cr>', {
    noremap = true,
    silent = true
})
