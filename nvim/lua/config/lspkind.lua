local lspkind = require('lspkind')
require("cmp").setup({
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...'
        })
    }
})
