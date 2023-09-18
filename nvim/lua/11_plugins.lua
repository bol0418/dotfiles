return {{
    -- colorsheme
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require('config/tokyonight')
    end
}, {
    -- status line
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('config/lualine')
    end
}, {
    -- git status
    'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup()
    end
}, { -- toggle comment
    'numToStr/Comment.nvim',
    config = function()
        require('config/comment')
    end
}, {
    -- highlighting
    'nvim-treesitter/nvim-treesitter',
    init = function()
        require('config/treesitter')
    end
}, {
    -- highlighting
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
        require('config/treesitter-context')
    end
}, {
    -- Finder
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = function()
        require('config/telescope')
    end
}, {
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require('config/todo-comments')
    end
}}
