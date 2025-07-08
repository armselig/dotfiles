local key = vim.keymap
-- local conform = require("conform")

--- MISC
key.set({ "n", "v" }, "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help tags" })
key.set({ "n", "v" }, "n", "nzz", { desc = "Center next search result" })
key.set({ "n", "v" }, "N", "Nzz", { desc = "Center previous search result" })
key.set("n", "<leader>q", "<cmd>qa!<CR>", { desc = "Force quit all" })
-- key.set({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
-- key.set({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })

--- FILE MANAGEMENT
key.set({ "n", "v" }, "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Files: Find" })
key.set({ "n", "v" }, "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Files: Grep" })
key.set({ "n", "v" }, "<leader>fr", "<cmd>Telescope frecency workspace=CWD <CR>", { desc = "Files: fRecent" })
key.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Files: To-do" })

--- TEXT EDITING
key.set("n", "<leader>h", "^", { desc = "Go to first non-whitespace character in line" })
key.set("n", "<leader>l", "$", { desc = "Go to end of line" })
