local setkeymap = vim.keymap.set

-- [[ Setting options ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- Diagnostic keymaps
vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, { desc = "Go to [D]iagnostics [P]revious" })
vim.keymap.set("n", "dn", vim.diagnostic.goto_next, { desc = "Go to [D]iagnostics [N]ext" })
vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Open [D]iagnostics [F]loating window" })
vim.keymap.set("n", "dq", vim.diagnostic.setloclist, { desc = "Set diagnostic loc list" })

-- Move to previous/next
vim.keymap.set(
	"n",
	"<A-,>",
	"<Cmd>BufferPrevious<CR>",
	{ desc = "[A] Move to previous buffer", noremap = true, silent = true }
)
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { desc = "[A] Move to next buffer", noremap = true, silent = true })
vim.keymap.set(
	"n",
	"<A-<>",
	"<Cmd>BufferMovePrevious<CR>",
	{ desc = "[A] move buffer to the left", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<A->>",
	"<Cmd>BufferMoveNext<CR>",
	{ desc = "[A] move buffer to the right", noremap = true, silent = true }
)

-- Debugging
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
	require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

------- others ---------
vim.keymap.set("n", "{", "{zz", { desc = "Move para up and center", noremap = true, silent = true })
vim.keymap.set("n", "}", "}zz", { desc = "Move para down and center", noremap = true, silent = true })
setkeymap({ "n", "i" }, "<C-S>", "<Cmd>w<CR>", { desc = "Save the current buffer" })

setkeymap({"i"}, "jj", "<Esc>", {desc = "Return to normal mode"})
setkeymap({"n"}, "nl", "$a<CR><ESC>", {desc = "Crete new line below"})
