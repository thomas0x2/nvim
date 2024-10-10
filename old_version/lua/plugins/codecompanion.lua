return{

	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- Optional
			{
				"stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
				opts = {},
			},
		},
		config = function()
			require("codecompanion").setup({
				adapters = {
					anthropic = require("codecompanion.adapters").use("anthropic", {
						env = {
							api_key = "ANTHROPIC_API_KEY",
						},
					}),
				},
				strategies = {
					chat = "anthropic",
					inline = "anthropic",
				},
			})
			vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"<LocalLeader>a",
				"<cmd>CodeCompanionToggle<cr>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<LocalLeader>a",
				"<cmd>CodeCompanionToggle<cr>",
				{ noremap = true, silent = true }
			)

			-- Expand `cc` into CodeCompanion in the command line
			vim.cmd([[cab cc CodeCompanion]])
		end,
	},
}


