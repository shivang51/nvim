require("mason").setup()
require("mason-nvim-dap").setup()
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

require("nvim-tree").setup()

-- Turn on lsp status information
-- require('fidget').setup()

-- Enable Comment.nvim
require("Comment").setup()

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require("ibl").setup({
	indent = {
		char = "┊",
	},
})

-- Gitsigns
-- See `:help gitsigns.txt`
require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
})

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})

require("telescope").load_extension("flutter")

require("flutter-tools").setup({
	flutter_path = "/home/shivang/Work/Tools/flutter/bin/flutter",
	decorations = {
		statusline = {
			device = true,
		},
	},
})

require("nvim-ts-autotag").setup({})

require("plugins.lualine")

require("plugins.nvim-treesitter")

require("plugins.dap")

require("plugins.none-ls")
