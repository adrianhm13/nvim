return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			inlay_hints = { enabled = false },
		},
	},
	{
		"mason-org/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"eslint-lsp",
				"luacheck",
				"shellcheck",
				"shfmt",
				"tailwindcss-language-server",
				"gopls",
				"css-lsp",
				"phpstan",
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		opts = function()
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			local null_ls = require("null-ls")

			local opts = {
				sources = {
					null_ls.builtins.diagnostics.phpstan,
				},
			}
			return opts
		end,
	},
	{
		"https://gitlab.com/schrieveslaach/sonarlint.nvim",
		config = function()
			require("sonarlint").setup({
				server = {
					cmd = {
						vim.fn.expand("~/.local/share/nvim/mason/bin/sonarlint-language-server"),
						-- Ensure that sonarlint-language-server uses stdio channel
						"-stdio",
						"-analyzers",
						-- paths to the analyzers you need, using those for python and java in this example
						vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarjs.jar"),
					},
					settings = {
						-- The default for sonarlint is {}, this is just an example
						sonarlint = {
							rules = {
								["typescript:S101"] = { level = "on", parameters = { format = "^[A-Z][a-zA-Z0-9]*$" } },
								["typescript:S103"] = { level = "on", parameters = { maximumLineLength = 180 } },
								["typescript:S106"] = { level = "on" },
								["typescript:S107"] = { level = "on", parameters = { maximumFunctionParameters = 7 } },
							},
						},
					},
				},
				filetypes = {
					-- Tested and working
					"cpp",
					"typescriptreact",
					"typescript",
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				php = { "phpstan" },
			},
		},
	},
}
