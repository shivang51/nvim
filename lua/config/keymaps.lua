vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set({ "i", "n" }, "<C-s>", "<Cmd>w<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<c-\\><c-n>")

vim.keymap.set("n", "<C-M-t>", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 8)
end, { desc = "Open Terminal" })

-- lsp keymaps
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type [D]efinition" })
vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { desc = "[D]ocument [S]ymbols" })
vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols,
	{ desc = "[W]orkspace [S]ymbols" })


vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

vim.keymap.set("n", "<space>sf", require('telescope.builtin').find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<space><space>", require('telescope.builtin').buffers, { desc = "Search open buffers" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sgf", require("telescope.builtin").git_files, { desc = "[S]earch [G]it [F]iles" })

-- Diagnostic keymaps
vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, { desc = "Go to [D]iagnostics [P]revious" })
vim.keymap.set("n", "dn", vim.diagnostic.goto_next, { desc = "Go to [D]iagnostics [N]ext" })
vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Open [D]iagnostics [F]loating window" })
vim.keymap.set("n", "dq", vim.diagnostic.setloclist, { desc = "Set diagnostic loc list" })

-- switch between two buffers
vim.keymap.set("n", "<c-tab>", "<c-^>", { desc = "Swith between two buffers" })

-- insert lines and escape
vim.keymap.set({ "n" }, "o", "o<Esc>", { desc = "Create new line below" })
vim.keymap.set({ "n" }, "O", "O<Esc>", { desc = "Create new line above" })
