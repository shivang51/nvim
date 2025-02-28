vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.keymap.set("n", "<space>ndi", "<cmd>Dotnet new<CR>", { desc = "Dotnet - [N]ew [D]otnet [I]tem" })
vim.keymap.set("n", "<space>bs", "<cmd>Dotnet build solution<CR>", { desc = "Dotnet - [B]uild [S]olution" })
vim.keymap.set("n", "<space>tr", "<cmd>Dotnet testrunner<CR>", { desc = "Dotnet - [T]est [R]unner" })
vim.keymap.set("n", "<space>rp", "<cmd>Dotnet run<CR>", { desc = "Dotnet - [R]un [P]roject" })
