return {
	"folke/trouble.nvim",
	cmd = { "Trouble" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		modes = {
			lsp = {
				win = {
					type = "split", -- split window
					relative = "win", -- relative to current window
					position = "right", -- right side
					size = 0.3, -- 30% of the window
				},
			},
		},
	},
}
