-- Define a table of options
local options = {
	encoding = "utf-8", -- Set the encoding to UTF-8
	fileencoding = "utf-8", -- Set the file encoding to UTF-8
	backup = false, -- Disable creating backup files
	clipboard = "unnamedplus", -- Use the system clipboard
	completeopt = { "menuone", "noselect" }, -- Configure completion options
	conceallevel = 0, -- Don"t hide concealed text
	hlsearch = true, -- Highlight search matches
	ignorecase = true, -- Ignore case in search patterns
	mouse = "a", -- Enable mouse support in all modes
	pumheight = 10, -- Maximum number of items to show in the popup menu
	smartcase = true, -- Override "ignorecase" if search pattern contains uppercase characters
	smartindent = true, -- Enable smart indentation
	swapfile = false, -- Disable creating swap files
	termguicolors = true, -- Enable 24-bit RGB color support
	timeoutlen = 1000, -- Set the timeout for mapped sequence to 300m
	undofile = true, -- Enable persistent undo
	updatetime = 300, -- Set the number of milliseconds to wait before triggering the plugin
	writebackup = false, -- Disable creating a backup before overwriting a file
	backupskip = { "/tmp/*", "/private/tmp/*" }, -- Directories to skip when creating backup files
	expandtab = true, -- Use spaces instead of tabs
	shiftwidth = 2, -- Number of spaces to use for each step of indent
	tabstop = 2, -- Number of spaces that a <Tab> in the file counts for
	cursorline = true, -- Highlight the current line
	number = true, -- Show line numbers
	relativenumber = false, -- Disable relative line numbers
	numberwidth = 4, -- Set the width of the number column
	signcolumn = "yes", -- Always show the sign column
	wrap = true, -- Enable line wrapping
	breakindent = true, -- Enable break indent
	winblend = 0, -- Disable pseudo-transparency for floating windows
	showbreak = "↪ ", -- Set the character to display for wrapped lines
	wildoptions = "pum", -- Display completion matches using the popup menu
	pumblend = 5, -- Set pseudo-transparency for the popup menu
	background = "dark", -- Set the colorscheme background to dark
	scrolloff = 8, -- Number of lines to keep above and below the cursor
	sidescrolloff = 8, -- Number of columns to keep to the left and right of the cursor
}

-- Iterate over the options table and set each option in Neovim
for k, v in pairs(options) do
	vim.opt[k] = v
end
-- Append "c" to the "shortmess" option
vim.opt.shortmess:append("c")

-- If not running in VSCode, set additional options
if not vim.g.vscode then
	vim.opt.title = true -- Show the title in the window title bar
	vim.opt.cmdheight = 2 -- Set the height of the command line
	vim.opt.showmode = true -- Display the current mode in the command line
	vim.opt.showtabline = 2 -- Always show the tabline
	vim.opt.virtualedit = "onemore"

	vim.cmd("set whichwrap+=<,>,[,],h,l") -- Allow specified keys to move the cursor to the previous/next line
	vim.cmd([[set iskeyword+=-]]) -- Consider dash as part of a word
end

-- If running in Windows Subsystem for Linux (WSL), configure clipboard support
if vim.fn.has("wsl") then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i",
			["*"] = "win32yank.exe -i",
		},
		paste = {
			["+"] = "win32yank.exe -o",
			["*"] = "win32yank.exe -o",
		},
		cache_enable = 1,
	}
end
