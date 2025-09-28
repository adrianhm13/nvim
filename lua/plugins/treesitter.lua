return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"astro",
				"cmake",
				"cpp",
				"css",
				"fish",
				"gitignore",
				"go",
				"graphql",
				"http",
				"java",
				"php",
				"rust",
				"scss",
				"sql",
				"svelte",
				"typescript",
				"lua",
				"javascript",
				"tsx",
				"ninja",
				"python",
				"rst",
				"toml",
				"c",
				"vim",
				"vimdoc",
				"query",
			},
			textobjects = {
				move = {
					enable = true,
					goto_next_start = {
						["]v"] = "@variable_declaration.outer",
					},
				},
			},
		},
	},
}
