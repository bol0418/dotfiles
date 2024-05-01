if not vim.g.vscode then
	return {
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		config = function()
			require("neo-tree").setup({
				source_selector = {
					winbar = true,
					statusline = true,
				},
				window = {
					width = 30,
				},
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
					hijack_netrw_behavior = "open_current",
					filtered_items = {
						visible = false,
						show_hiden_count = true,
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_by_name = { ".ipynb" },
					},
					never_show = { ".git", ".DS_Store", ".history" },
				},
			})
		end,
		keys = {
			{
				"<C-space><C-e>",
				desc = "Toggle Neo Tree",
				function()
					require("neo-tree.command").execute({
						toggle = true,
						position = "left",
					})
				end,
			},
		},
	}
else
	return {}
end
