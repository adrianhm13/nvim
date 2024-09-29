return {
	"folke/trouble.nvim",
	cmd = { "Trouble" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		modes = {
			symbols = { -- Configure symbols mode
				win = {
					type = "split", -- split window
					relative = "win", -- relative to current window
					position = "right", -- right side
					size = 1.0, -- 30% of the window
				},
			},
		},
	},
}
