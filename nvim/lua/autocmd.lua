vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')

-- ファイルタイプ別のインデント設定
local indent_settings = {
    html = {
        sw = 4,
        sts = 4,
        ts = 4,
        et = true
    },
    js = {
        sw = 4,
        sts = 4,
        ts = 4,
        et = true
    },
    zsh = {
        sw = 4,
        sts = 4,
        ts = 4,
        et = true
    },
    python = {
        sw = 4,
        sts = 4,
        ts = 4,
        et = true
    },
    json = {
        sw = 4,
        sts = 4,
        ts = 4,
        et = true
    },
    css = {
        sw = 4,
        sts = 4,
        ts = 4,
        et = true
    },
    scss = {
        sw = 4,
        sts = 4,
        ts = 4,
        et = true
    },
    sass = {
        sw = 4,
        sts = 4,
        ts = 4,
        et = true
    },
    javascript = {
        sw = 4,
        sts = 4,
        ts = 4,
        et = true
    },
    lua = {
        sw = 4,
        sts = 4,
        ts = 4,
        et = true
    }
}

local function set_indent_settings()
    local filetype = vim.bo.filetype
    if indent_settings[filetype] then
        for k, v in pairs(indent_settings[filetype]) do
            vim.bo[k] = v
        end
    end
end

vim.api.nvim_create_autocmd('FileType', {
    callback = set_indent_settings
})
