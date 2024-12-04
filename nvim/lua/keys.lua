local key = vim.keymap
local conform = require("conform")

--- MISC
key.set({ 'n', 'v' }, '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = "Find help tags" })
key.set({ 'n', 'v' }, 'n', 'nzz', { desc = "Center next search result" })
key.set({ 'n', 'v' }, 'N', 'Nzz', { desc = "Center previous search result" })
key.set('t', '<C-h>', '<cmd>wincmd h<CR>', { desc = "Terminal: Go to left pane" })
key.set('t', '<C-j>', '<cmd>wincmd j<CR>', { desc = "Terminal: Go to pane below" })
key.set('t', '<C-k>', '<cmd>wincmd k<CR>', { desc = "Terminal: Go to pane above" })
key.set('t', '<C-l>', '<cmd>wincmd l<CR>', { desc = "Terminal: Go to right pane" })
key.set('n', '<leader>q', '<cmd>qa!<CR>', { desc = 'Force quit all' })

--- FILE MANAGEMENT
key.set({ 'n', 'v' }, '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = "Files: Find" })
key.set({ 'n', 'v' }, '<leader>fg', '<cmd>Telescope live_grep<CR>', { desc = "Files: Grep" })
key.set({ 'n', 'v' }, '<leader>fb', '<cmd>NvimTreeToggle<CR>', { desc = "Files: Browse" })
key.set({ 'n', 'v' }, '<leader>fp', function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_md = 1000
    })
end
, { desc = "Files: Prettify" })
key.set({ 'n', 'v' }, '<leader>fr', '<cmd>Telescope frecency workspace=CWD <CR>', { desc = "Files: fRecent" })

--- GIT
key.set({ 'n', 'v' }, '<leader>gg', '<cmd>Git<CR>', { desc = "Git gud" })
key.set({ 'n', 'v' }, '<leader>gpl', '<cmd>Git pull<CR>', { desc = "Git pull" })
key.set({ 'n', 'v' }, '<leader>gps', '<cmd>Git push<CR>', { desc = "Git push" })
key.set({ 'n', 'v' }, '<leader>gco', ':Git checkout ', { desc = "Git checkout" })
key.set({ 'n', 'v' }, '<leader>ga', ':Git add ', { desc = "Git add" })

--- BUFFERS
key.set({ 'n', 'v' }, 'H', '<cmd>bprevious<CR>', { desc = "Buffers: Previous" })
key.set({ 'n', 'v' }, 'L', '<cmd>bnext<CR>', { desc = "Buffers: Next" })
key.set({ 'n', 'v' }, '<leader>bb', '<cmd>Telescope buffers<CR>', { desc = "Buffers: Browse" })

--- TEXT EDITING
key.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
key.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
key.set('n', '<leader>h', '^', { desc = "Go to first non-whitespace character in line" })
key.set('n', '<leader>l', '$', { desc = "Go to end of line" })

--- RESIZING
key.set('n', '<leader><Up>', ':resize -2<CR>', { desc = "Pane: Reduce height" })
key.set('n', '<leader><Down>', ':resize +2<CR>', { desc = "Pane: Increase height" })
key.set('n', '<leader><Left>', ':vertical resize -2<CR>', { desc = "Pane: Reduce width" })
key.set('n', '<leader><Right>', ':vertical resize +2<CR>', { desc = "Pane: Increase width" })

key.set('t', '<leader><Up>', '<cmd>resize -2<CR>', { desc = "Pane: Reduce height" })
key.set('t', '<leader><Down>', '<cmd>resize +2<CR>', { desc = "Pane: Increase height" })
key.set('t', '<leader><Left>', '<cmd>vertical resize -2<CR>', { desc = "Pane: Reduce width" })
key.set('t', '<leader><Right>', '<cmd>vertical resize +2<CR>', { desc = "Pane: Increase width" })

--- DIAGNOSTICS
key.set('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>',
    { desc = 'Diagnostics: Open float', noremap = true, silent = true })
key.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
    { desc = 'Diagnostics: Previous', noremap = true, silent = true })
key.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>',
    { desc = 'Diagnostics: Next', noremap = true, silent = true })
key.set('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>',
    { desc = 'Diagnostics: Browse', noremap = true, silent = true })
