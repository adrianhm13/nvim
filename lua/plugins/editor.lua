return {
	{
		enabled = false,
		"folke/flash.nvim",
		---@type Flash.Config
		opts = {
			search = {
				forward = true,
				multi_window = false,
				wrap = false,
				incremental = true,
			},
		},
	},

	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {
			highlighters = {
				hsl_color = {
					pattern = "hsl%(%d+,? %d+,? %d+%)",
					group = function(_, match)
						--- @type string, string, string
						local nh, ns, nl = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
						--- @type number?, number?, number?
						local h, s, l = tonumber(nh), tonumber(ns), tonumber(nl)
						--- @type string
					end,
				},
			},
		},
	},
	{
		"echasnovski/mini.diff",
		event = "VeryLazy",
		keys = {
			{
				"<leader>go",
				function()
					require("mini.diff").toggle_overlay(0)
				end,
				desc = "Toggle mini.diff overlay",
			},
		},
		opts = {
			view = {
				style = "sign",
				signs = {
					add = "▎",
					change = "▎",
					delete = "",
				},
			},
		},
	},
	-- {
	-- 	require("tokyonight").setup({
	-- 		on_highlights = function(hl, c)
	-- 			local prompt = "#2d3149"
	-- 			hl.TelescopeNormal = {
	-- 				bg = c.bg_dark,
	-- 				fg = c.fg_dark,
	-- 			}
	-- 			hl.TelescopeBorder = {
	-- 				bg = c.bg_dark,
	-- 				fg = c.bg_dark,
	-- 			}
	-- 			hl.TelescopePromptNormal = {
	-- 				bg = prompt,
	-- 			}
	-- 			hl.TelescopePromptBorder = {
	-- 				bg = prompt,
	-- 				fg = prompt,
	-- 			}
	-- 			hl.TelescopePromptTitle = {
	-- 				bg = prompt,
	-- 				fg = prompt,
	-- 			}
	-- 			hl.TelescopePreviewTitle = {
	-- 				bg = c.bg_dark,
	-- 				fg = c.bg_dark,
	-- 			}
	-- 			hl.TelescopeResultsTitle = {
	-- 				bg = c.bg_dark,
	-- 				fg = c.bg_dark,
	-- 			}
	-- 		end,
	-- 	}),
	},
	-- {
	-- 	"telescope.nvim",
	-- 	dependencies = {
	-- 		{
	-- 			"nvim-telescope/telescope-fzf-native.nvim",
	-- 			build = "make",
	-- 		},
	-- 		"nvim-telescope/telescope-file-browser.nvim",
	-- 	},
	-- 	keys = {
	-- 		{
	-- 			"<leader>fP",
	-- 			function()
	-- 				require("telescope.builtin").find_files({
	-- 					cwd = require("lazy.core.config").options.root,
	-- 				})
	-- 			end,
	-- 			desc = "Find Plugin File",
	-- 		},
	-- 		{
	-- 			";f",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.find_files({ follow = true })
	-- 			end,
	-- 			desc = "Lists files in your current working directory",
	-- 			onOpen,
	-- 		},
	-- 		{
	-- 			";r",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.live_grep({ follow = true })
	-- 			end,
	-- 			desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
	-- 		},
	-- 		{
	-- 			"\\\\",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.buffers()
	-- 			end,
	-- 			desc = "Lists open buffers",
	-- 		},
	-- 		{
	-- 			";t",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.help_tags()
	-- 			end,
	-- 			desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
	-- 		},
	-- 		{
	-- 			";;",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.resume()
	-- 			end,
	-- 			desc = "Resume the previous telescope picker",
	-- 		},
	-- 		{
	-- 			";e",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.diagnostics()
	-- 			end,
	-- 			desc = "Lists Diagnostics for all open buffers or a specific buffer",
	-- 		},
	-- 		{
	-- 			";s",
	-- 			function()
	-- 				local builtin = require("telescope.builtin")
	-- 				builtin.treesitter()
	-- 			end,
	-- 			desc = "Lists Function names, variables, from Treesitter",
	-- 		},
	-- 		{
	-- 			"sf",
	-- 			function()
	-- 				local telescope = require("telescope")
	--
	-- 				local function telescope_buffer_dir()
	-- 					return vim.fn.expand("%:p:h")
	-- 				end
	--
	-- 				telescope.extensions.file_browser.file_browser({
	-- 					path = "%:p:h",
	-- 					cwd = telescope_buffer_dir(),
	-- 					respect_gitignore = false,
	-- 					hidden = true,
	-- 					grouped = true,
	-- 					previewer = false,
	-- 					initial_mode = "normal",
	-- 					layout_config = { height = 40 },
	-- 				})
	-- 			end,
	-- 			desc = "Open File Browser with the path of the current buffer",
	-- 		},
	-- 	},
	-- 	config = function(_, opts)
	-- 		local telescope = require("telescope")
	-- 		local actions = require("telescope.actions")
	-- 		local fb_actions = require("telescope").extensions.file_browser.actions
	--
	-- 		opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
	-- 			follow = true,
	-- 			wrap_results = true,
	-- 			layout_strategy = "horizontal",
	-- 			layout_config = { prompt_position = "top" },
	-- 			sorting_strategy = "ascending",
	-- 			winblend = 0,
	-- 			mappings = {
	-- 				n = {},
	-- 			},
	-- 		})
	-- 		opts.pickers = {
	-- 			diagnostics = {
	-- 				theme = "ivy",
	-- 				initial_mode = "normal",
	-- 				layout_config = {
	-- 					preview_cutoff = 9999,
	-- 				},
	-- 			},
	-- 		}
	-- 		opts.extensions = {
	-- 			file_browser = {
	-- 				theme = "dropdown",
	-- 				-- disables netrw and use telescope-file-browser in its place
	-- 				hijack_netrw = true,
	-- 				mappings = {
	-- 					-- your custom insert mode mappings
	-- 					["n"] = {
	-- 						-- your custom normal mode mappings
	-- 						["N"] = fb_actions.create,
	-- 						["h"] = fb_actions.goto_parent_dir,
	-- 						["/"] = function()
	-- 							vim.cmd("startinsert")
	-- 						end,
	-- 						["<C-u>"] = function(prompt_bufnr)
	-- 							for i = 1, 10 do
	-- 								actions.move_selection_previous(prompt_bufnr)
	-- 							end
	-- 						end,
	-- 						["<C-d>"] = function(prompt_bufnr)
	-- 							for i = 1, 10 do
	-- 								actions.move_selection_next(prompt_bufnr)
	-- 							end
	-- 						end,
	-- 						["<PageUp>"] = actions.preview_scrolling_up,
	-- 						["<PageDown>"] = actions.preview_scrolling_down,
	-- 					},
	-- 				},
	-- 			},
	-- 		}
	-- 		telescope.setup(opts)
	-- 		require("telescope").load_extension("fzf")
	-- 		require("telescope").load_extension("file_browser")
	-- 	end,
	-- },
}
