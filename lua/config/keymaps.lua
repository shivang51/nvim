-- [[ Setting options ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, {desc = "Go to [D]iagnostics [P]revious"})
vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, {desc = "Go to [D]iagnostics [N]ext"})
vim.keymap.set('n', 'df', vim.diagnostic.open_float,{desc = "Open [D]iagnostics [F]loating window"})
vim.keymap.set('n', 'dq', vim.diagnostic.setloclist,{desc = "Set diagnostic loc list"})


-- Move to previous/next
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', {desc="[A] Move to previous buffer", noremap=true, silent=true})
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', {desc="[A] Move to next buffer", noremap=true, silent=true})
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', {desc="[A] move buffer to the left", noremap=true, silent=true})
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', {desc="[A] move buffer to the right", noremap=true, silent=true})

