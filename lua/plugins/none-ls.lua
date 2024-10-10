-- None-ls for linters and formatters
-- Space + g + f for formatting
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- Formatters
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.prettier,

				-- Linters
				null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.diagnostics.codespell,
				null_ls.builtins.diagnostics.checkstyle.with({
					extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
