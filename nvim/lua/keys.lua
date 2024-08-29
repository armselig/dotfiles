local key = vim.keymap

-- files: find
key.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
-- files: grep
key.set('n', '<leader>fg', '<cmd>Telescope live_grep')
-- files: browse
key.set('n', '<leader>fb', '<cmd>NvimTreeToggle<CR>')

