local utils = require("utils")
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

require("catppuccin").setup({
	flavour = "mocha",
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
})

vim.cmd("colorscheme catppuccin")

utils.make_italic("Comment")
utils.make_italic("Keyword")
utils.make_italic("Parameter")
utils.make_italic("TSParameter")
utils.make_italic("@variable.parameter")
-- vim.api.nvim_set_hl(0, "MyPMenuSel", { bg = "#202020" })

vim.opt.linespace = 6

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
