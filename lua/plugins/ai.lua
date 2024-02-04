return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					accept = false, -- disable built-in keymapping
				},
			})

			-- hide copilot suggestions when cmp menu is open
			-- to prevent odd behavior/garbled up suggestions
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if cmp_status_ok then
				cmp.event:on("menu_opened", function()
					vim.b.copilot_suggestion_hidden = true
				end)

				cmp.event:on("menu_closed", function()
					vim.b.copilot_suggestion_hidden = false
				end)
			end
		end,
	},
	-- https://github.com/jackMort/ChatGPT.nvim
	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
		},
		-- event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				actions_paths = { "~/.config/nvim/chatgpt-actions.json" },
				openai_params = {
					model = "gpt-4",
				},
				openai_edit_params = {
					model = "gpt-3.5-turbo",
					temperature = 0,
					top_p = 1,
					n = 1,
				},
			})
		end,
	},
}
