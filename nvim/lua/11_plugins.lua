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
    -- Finder
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = {"kkharji/sqlite.lua"},
    config = function()
        require('config/telescope-frecency')
    end
}, {
    -- Finder fzf
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    config = function()
        require('config/telescope-fzf-native')
    end
}, {
    -- Filer
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
        require('config/telescope-file-browser')
    end
}, {
    -- todo hightlighting
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require('config/todo-comments')
    end
}, {
    -- memolist
    "glidenote/memolist.vim",
    dependencies = {'nvim-telescope/telescope.nvim', 'delphinus/telescope-memo.nvim'},
    config = function()
        require('config/memolist')
    end
}, {
    -- Telescope for memolist plugin
    'delphinus/telescope-memo.nvim',
    config = function()
        require('config/telescope-memo')
    end
}}
