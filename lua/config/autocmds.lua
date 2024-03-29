local utils = require("utils")
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- callback = function()
-- 	if vim.bo.filetype ~= "norg" then
-- 		return
-- 	end
-- end,
--
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.norg" },
	command = "set conceallevel=3",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "cmp_docs",
	callback = function()
		vim.treesitter.start(0, "markdown")
	end,
})

-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = function()
-- 		utils.make_italic("Comment")
-- 		utils.make_italic("Keyword")
-- 		utils.make_italic("Parameter")
-- 		utils.make_italic("TSParameter")
-- 		utils.make_italic("@variable.parameter")
-- 		print("Italics Made")
-- 		-- vim.api.nvim_set_hl(0, "Comment", { italic = true })
-- 		-- vim.api.nvim_set_hl(0, "Keyword", { italic = true })
-- 		-- vim.api.nvim_set_hl(0, "Parameter", { italic = true })
-- 		-- vim.api.nvim_set_hl(0, "TSParameter", { italic = true })
-- 		-- vim.api.nvim_set_hl(0, "@variable.parameter", { italic = true })
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("ModeChanged", {
-- 	pattern = "*",
-- 	callback = function()
-- 		if
-- 			((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
-- 			and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
-- 			and not require("luasnip").session.jump_active
-- 		then
-- 			require("luasnip").unlink_current()
-- 		end
-- 	end,
-- })
