-- Character encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Search
-- As you type a search term, the cursor incrementally jumps to the nearest matching location
vim.o.incsearch = true
-- Ignore case differences in English letters when searching
vim.o.ignorecase = true
-- Controls the highlighting of search matches
vim.opt.hlsearch = true
-- Override ignorecase and distinguish between uppercase and lowercase when including uppercase in search
vim.o.smartcase = true

-- Indent and Tab
-- Use half-width spaces instead of tab symbols when inserting tabs
vim.bo.expandtab = true
-- Set the indent to the same as the current line when inserting a new line
vim.bo.autoindent = true
-- Set indentation one step back considering {} etc.
vim.bo.smartindent = true
-- Set tab width to 2 spaces.
vim.opt.tabstop = 2
-- Set indentation to 2 spaces.
vim.opt.shiftwidth = 2

-- Basic Visuals
-- Enable true color support in the terminal
vim.opt.termguicolors = true
-- Display line numbers
vim.opt.number = true
-- Display the command being entered
vim.opt.showcmd = true
-- Set the height of the command line
vim.opt.cmdheight = 2
-- Control how the status line is displayed
vim.opt.laststatus = 3
-- Make wrapped lines visually indented
vim.opt.breakindent = true
--  Enable line wrapping
vim.opt.wrap = true
-- When a bracket is used, quickly move to its matching pair if close by
vim.o.showmatch = true
-- Allow more than one unsaved buffer to exist at the same time
vim.opt.hidden = true

-- Other
-- Enable mouse
vim.opt.mouse = 'a'

-- Clipboard cooperation
vim.opt.clipboard:append{'unnamedplus'}

-- Do not yank when deleted with x
vim.api.nvim_set_keymap("n", "x", '"_x', {
    noremap = true,
    silent = true
})

-- Enables persistent undo, which allows you to undo changes even after closing and reopening a file.
vim.o.undofile = true
-- Specifies the directory where undo files are stored.
vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'
