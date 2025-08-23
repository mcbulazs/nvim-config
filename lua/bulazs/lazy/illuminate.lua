return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			under_cursor = false,
		})
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Underlined" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Underlined" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Underlined" })
	end,
}
