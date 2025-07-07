return {
    "tpope/vim-surround",
    event = "VeryLazy",
    config = function()
        -- No specific configuration needed for vim-surround
        -- as it works out of the box.
        -- However, you can customize key mappings if desired.
        -- Example: vim.api.nvim_set_keymap('n', 'ys', '<Plug>Surround', { noremap = true, silent = true })
    end,
    dependencies = {
        "tpope/vim-repeat", -- Optional: for repeating surround commands
    },
    -- Optional: You can add additional settings or key mappings here
    -- if you want to customize the behavior of vim-surround.
    -- For example, you can set up custom key mappings for surround commands.
}
