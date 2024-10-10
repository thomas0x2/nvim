return {
	{
		"MeanderingProgrammer/dashboard.nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- Dashboard header
				header = {},
				-- Format to display date in
				date_format = nil,
				-- List of directory paths, or functions that return paths
				directories = {},
				-- Sections to add at bottom, these can be string references to
				-- functions in sections.lua, custom strings, or custom functions
				footer = {},
				-- Gets called after directory is changed and is provided with the
				-- directory string as an argument
				on_load = function(dir)
					-- Do nothing
				end,
				-- Highlight groups to use for various components
				highlight_groups = {
					header = "Constant",
					icon = "Type",
					directory = "Delimiter",
					hotkey = "Statement",
				},
			})
		end,
	},
	{
		"MeanderingProgrammer/dashboard.nvim",
		event = "VimEnter",
		dependencies = {
			{ "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
		},
		config = function()
			require("dashboard").setup({
				header = require("ascii").art.text.neovim.sharp,
                date_format = '%Y-%m-%d %H:%M:%S',
				directories = {
					"~/Workspace/",
					"~/Workspace/Bachelorarbeit/python/",
					"~/.config/nvim/init.lua",
					"~/.config/nvim/lua/plugins/",
				},
			})
		end,
	},
}
