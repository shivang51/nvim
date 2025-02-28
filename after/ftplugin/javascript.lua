local neotest = require('neotest')

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.keymap.set("n", "<space>ns", function() neotest.summary.toggle() end, { desc = "[N]eotest [S]ummary" })
vim.keymap.set("n", "<space>no", function() neotest.output_panel.toggle() end, { desc = "[N]eotest [O]utput" })
vim.keymap.set("n", "<space>na", function() neotest.run.attach() end, { desc = "[N]eotest [A]ttach" })
vim.keymap.set("n", "<space>nts", function() neotest.run.stop() end, { desc = "[N]eotest [T]est [S]top" })
vim.keymap.set("n", "<space>ptr", function() neotest.playwright.refresh() end, { desc = "[P]laywright [T]est [R]efresh" })

-- clear neotest ouput panel
vim.keymap.set("n", "<space>nco", function()
    local buf = vim.fn.bufnr 'Neotest Output Panel'
    if buf ~= -1 then
        vim.api.nvim_buf_set_option(buf, "modifiable", true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
        vim.api.nvim_buf_set_option(buf, "modifiable", false)
    end
    neotest.run.run(opts)
end, { desc = "[N]eotest [C]lear [O]utput" })
