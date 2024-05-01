if not vim.g.vscode then
	return {
		{
			"renerocksai/telekasten.nvim",
			dependencies = {
				"dharmx/telescope-media.nvim",
				"iamcco/markdown-preview.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-lua/popup.nvim",
				"nvim-telescope/telescope-symbols.nvim",
				"nvim-telescope/telescope.nvim",
				"renerocksai/calendar-vim",
			},
			config = function()
				local home = vim.fn.expand("~/zettelkasten")
				local templ_dir = vim.fn.stdpath("config") .. "/zettelkasten/templates"

				require("telekasten").setup({
					home = home,
					templates = templ_dir,
					dailies = home .. "/" .. "daily",
					extension = ".md",
					image_link_style = "markdown",
					subdirs_in_links = true,
					template_handling = "smart",
					new_note_location = "smart",
					rename_update_links = true,

					-- following a link to a non-existing note will create it
					follow_creates_nonexisting = true,
					dailies_create_nonexisting = true,
					weeklies_create_nonexisting = true,

					-- templates
					template_new_note = templ_dir .. "/new_note.md",
					template_new_daily = templ_dir .. "/new_daily.md",
				})

				-- Launch panel if nothing is typed after <leader>z
				vim.keymap.set(
					"n",
					"<leader>z",
					"<cmd>Telekasten panel<CR>",
					{ silent = true, desc = "Open Telekasten panel" }
				)

				-- Most used functions
				vim.keymap.set(
					"n",
					"<leader>zf",
					"<cmd>Telekasten find_notes<CR>",
					{ silent = true, desc = "Find notes using Telescope (telekasten)" }
				)
				vim.keymap.set(
					"n",
					"<leader>zg",
					"<cmd>Telekasten search_notes<CR>",
					{ silent = true, desc = "Search notes using Telescope (telekasten)" }
				)
				vim.keymap.set(
					"n",
					"<leader>zd",
					"<cmd>Telekasten goto_today<CR>",
					{ silent = true, desc = "Go to today's daily note (telekasten)" }
				)
				vim.keymap.set(
					"n",
					"<leader>zz",
					"<cmd>Telekasten follow_link<CR>",
					{ silent = true, desc = "Follow link under cursor (telekasten)" }
				)
				vim.keymap.set(
					"n",
					"<leader>zn",
					"<cmd>Telekasten new_note<CR>",
					{ silent = true, desc = "Create new note (telekasten)" }
				)
				vim.keymap.set(
					"n",
					"<leader>zc",
					"<cmd>Telekasten show_calendar<CR>",
					{ silent = true, desc = "Show calendar (telekasten)" }
				)
				vim.keymap.set(
					"n",
					"<leader>zb",
					"<cmd>Telekasten show_backlinks<CR>",
					{ silent = true, desc = "Show backlinks (telekasten)" }
				)
				vim.keymap.set(
					"n",
					"<leader>zI",
					"<cmd>Telekasten insert_img_link<CR>",
					{ silent = true, desc = "Insert image link (telekasten)" }
				)

				-- Call insert link automatically when we start typing a link
				vim.keymap.set(
					"i",
					"[[",
					"<cmd>Telekasten insert_link<CR>",
					{ silent = true, expr = true, desc = "Insert link (telekasten)" }
				)
			end,
		},
	}
else
	return {}
end
