return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
			{ "folke/neodev.nvim", opts = {} },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			inlay_hints = { enabled = false },
		},
		-- opts = function()
		-- 	local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- 	local lspconfig = require("lspconfig")
		--
		-- 	lspconfig.lua_ls.setup({
		-- 		capabilities = capabilities,
		-- 	})
		-- 	lspconfig.gopls.setup({
		-- 		capabilities = capabilities,
		-- 	})
		-- 	inlay_hints = {
		-- 		enabled = false,
		-- 	}
		-- end,
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, {
				"stylua",
				"eslint-lsp",
				"luacheck",
				"shellcheck",
				"shfmt",
				"prettierd",
				"tailwindcss-language-server",
				"typescript-language-server",
				"gopls",
				"css-lsp",
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
					null_ls.builtins.formatting.prettierd,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({
							group = augroup,
							buffer = bufnr,
						})
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			}
			return opts
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "gopls" },
			})
		end,
	},
	-- {
	-- 	"https://gitlab.com/schrieveslaach/sonarlint.nvim",
	-- 	config = function()
	-- 		require("sonarlint").setup({
	-- 			server = {
	-- 				cmd = {
	-- 					vim.fn.expand("~/.local/share/nvim/mason/bin/sonarlint-language-server"),
	-- 					-- Ensure that sonarlint-language-server uses stdio channel
	-- 					"-stdio",
	-- 					"-analyzers",
	-- 					-- paths to the analyzers you need, using those for python and java in this example
	-- 					vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarjs.jar"),
	-- 				},
	-- 				settings = {
	-- 					-- The default for sonarlint is {}, this is just an example
	-- 					sonarlint = {
	-- 						rules = {
	-- 							["typescript:S101"] = { level = "on", parameters = { format = "^[A-Z][a-zA-Z0-9]*$" } },
	-- 							["typescript:S103"] = { level = "on", parameters = { maximumLineLength = 180 } },
	-- 							["typescript:S106"] = { level = "on" },
	-- 							["typescript:S107"] = { level = "on", parameters = { maximumFunctionParameters = 7 } },
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 			filetypes = {
	-- 				-- Tested and working
	-- 				"cpp",
	-- 				"typescriptreact",
	-- 				"typescript",
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
