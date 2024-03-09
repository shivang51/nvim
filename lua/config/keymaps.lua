local setkeymap = vim.keymap.set

-- [[ Setting options ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

setkeymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
setkeymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
setkeymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- See `:help telescope.builtin`
setkeymap("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
setkeymap("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
setkeymap("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

setkeymap("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Git Files Search" })
setkeymap("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
setkeymap("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
setkeymap("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
setkeymap("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
setkeymap("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- Diagnostic keymaps
setkeymap("n", "dp", vim.diagnostic.goto_prev, { desc = "Go to [D]iagnostics [P]revious" })
setkeymap("n", "dn", vim.diagnostic.goto_next, { desc = "Go to [D]iagnostics [N]ext" })
setkeymap("n", "df", vim.diagnostic.open_float, { desc = "Open [D]iagnostics [F]loating window" })
setkeymap("n", "dq", vim.diagnostic.setloclist, { desc = "Set diagnostic loc list" })

-- Debugging
setkeymap("n", "<F5>", function()
	require("dap").continue()
end)
setkeymap("n", "<F10>", function()
	require("dap").step_over()
end)
setkeymap("n", "<F11>", function()
	require("dap").step_into()
end)
setkeymap("n", "<F12>", function()
	require("dap").step_out()
end)
setkeymap("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
setkeymap("n", "<Leader>B", function()
	require("dap").set_breakpoint()
end)
setkeymap("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
setkeymap("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
setkeymap("n", "<Leader>dl", function()
	require("dap").run_last()
end)
setkeymap({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
setkeymap({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
setkeymap("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
setkeymap("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

------- move and center ---------
setkeymap("n", "{", "{zz", { desc = "Move para up and center", noremap = true, silent = true })
setkeymap("n", "}", "}zz", { desc = "Move para down and center", noremap = true, silent = true })
setkeymap("n", "G", "Gzz", { desc = "Move to eof and center", noremap = true, silent = true })

setkeymap({ "n", "i" }, "<C-S>", "<Cmd>w<CR>", { desc = "Save the current buffer" })

setkeymap({ "i" }, "jj", "<Esc>", { desc = "Return to normal mode" })

setkeymap({ "n" }, "o", "o<Esc>zz", { desc = "Crete new line below" })
setkeymap({ "n" }, "O", "O<Esc>zz", { desc = "Crete new line above" })

setkeymap({ "n" }, "<Leader>ex", vim.cmd.NvimTreeToggle, { desc = "Open Nvim Tree" })
setkeymap({ "n" }, "<C-C>", '"+Y', { desc = "Copy contents to clipboard" })

-------- accept github copilot suggesstion when there is nvim-cmp confict -------
setkeymap({ "i" }, "<C-j>", 'copilot#Accept("")', {
	expr = true,
	replace_keycodes = false,
	desc = "Accept copilot suggesstion",
})
