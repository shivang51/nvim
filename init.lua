vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.keymaps")


vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.linespace = 6

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})
