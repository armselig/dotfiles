local key = vim.keymap

--- MISC
key.set({ "n", "v" }, "n", "nzz", { desc = "Center next search result" })
key.set({ "n", "v" }, "N", "Nzz", { desc = "Center previous search result" })

--- TEXT EDITING
key.set("n", "<leader>h", "^", { desc = "Go to first non-whitespace character in line" })
key.set("n", "<leader>l", "$", { desc = "Go to end of line" })
