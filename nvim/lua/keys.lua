local key = vim.keymap
local conform = require("conform")

-- files: find
key.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
-- files: grep
key.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
-- files: browse
key.set('n', '<leader>fb', '<cmd>NvimTreeToggle<CR>')
-- files: prettify
key.set({ 'n', 'v' }, '<leader>fp', function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_md = 1000
    })
end
)
