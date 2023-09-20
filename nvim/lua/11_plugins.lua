return {{
    -- colorsheme
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    event = 'VeryLazy',
    config = function()
        require('config/tokyonight')
    end
}, {
    -- status line
    'nvim-lualine/lualine.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    event = 'VeryLazy',
    config = function()
        require('config/lualine')
    end
}, {
    -- git status
    'lewis6991/gitsigns.nvim',
    event = {'BufNewFile, BufRead'},
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
    cmd = 'Telescope',
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
    -- search kanji with romaji
    "Allianaab2m/telescope-kensaku.nvim",
    dependencies = {"nvim-telescope/telescope.nvim", "vim-denops/denops.vim", "lambdalisue/kensaku.vim"},
    config = function()
        require('config/telescope-kensaku')
    end
}, {
    -- search with romaji
    "lambdalisue/kensaku-command.vim",
    dependencies = "lambdalisue/kensaku-command.vim",
    event = "CmdlineEnter",
    config = function()
        require('config/kensaku-command')
    end
}, {
    -- search with romaji
    "lambdalisue/kensaku-search.vim",
    dependencies = "lambdalisue/kensaku-command.vim",
    event = "CmdlineEnter",
    config = function()
        require('config/kensaku-search')
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
    -- cmp
    "hrsh7th/nvim-cmp",
    event = 'InsertEnter, CmdlineEnter',
    config = function()
        require('config/nvim-cmp')
    end
}, {
    -- lsp
    'neovim/nvim-lspconfig',
    config = function()
        require("config/nvim-lspconfig")
    end
}, {
    -- lsp manager
    "williamboman/mason.nvim",
    event = {"WinNew", "WinLeave", "BufRead"},
    config = function()
        require("config/mason")
    end
}, {
    -- lsp manger config
    'williamboman/mason-lspconfig.nvim',
    event = "BufRead",
    config = function()
        require("config/mason-lspconfig")
    end
}, {
    -- lsp to cmp
    'hrsh7th/cmp-nvim-lsp',
    event = 'InsertEnter',
    config = function()
        require("config/cmp-nvim-lsp")
    end
}, {
    -- cmp from buffer
    'hrsh7th/cmp-buffer',
    event = 'InsertEnter',
    config = function()
        require("config/cmp-buffer")
    end
}, {
    -- path cmp
    'hrsh7th/cmp-path',
    event = 'InsertEnter',
    config = function()
        require("config/cmp-path")
    end
}, {
    -- change lsp view
    "onsails/lspkind.nvim",
    event = 'InsertEnter',
    config = function()
        require("config/lspkind")
    end
}, {
    -- snippet to cmp
    "hrsh7th/cmp-vsnip",
    config = function()
        require("config/cmp-vsnip")
    end
}, {
    -- cmp emojis
    "hrsh7th/cmp-emoji",
    event = 'InsertEnter',
    config = function()
        require("config/cmp-emoji")
    end
}, {
    -- cmp latex
    "kdheepak/cmp-latex-symbols",
    event = 'InsertEnter',
    config = function()
        require("config/cmp-latex-symbols")
    end
}, {
    -- snippet feature
    "hrsh7th/vim-vsnip",
    event = 'InsertEnter',
    config = function()
        require("config/vim-vsnip")
    end
}, {
    -- snippet integration
    "hrsh7th/vim-vsnip-integ",
    event = 'InsertEnter',
    config = function()
        require("config/vim-vsnip-integ")
    end
}, {
    -- snippet collections
    "rafamadriz/friendly-snippets",
    event = 'InsertEnter',
    config = function()
        require("config/friendly-snippets")
    end
}, {
    -- insert bracket pair
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        require("config/nvim-autopairs")
    end
}}
