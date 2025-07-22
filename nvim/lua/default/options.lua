local opt = vim.opt
local g = vim.g

-- set leader key to space
g.mapleader = ' '

-- general
opt.autoindent = true
opt.clipboard = "unnamed,unnamedplus"
opt.completeopt = "noinsert,menuone,noselect"
opt.cursorline = true
opt.expandtab = true
opt.formatoptions:remove("r")
opt.formatoptions:remove("o")
opt.hidden = true
opt.ignorecase = true
opt.inccommand = "split"
opt.mouse = "a"
opt.number = true
-- opt.nobackup = true
-- opt.noswapfile = true
-- opt.nowrap = true
opt.path:append("**")
opt.relativenumber = true
opt.scrolloff = 999
opt.shiftwidth = 4
opt.showmatch = true
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.shada = "'1000,f1,<50,s10,h"
opt.tabstop = 4
-- opt.t_Co = 256
opt.termguicolors = true

-- filetype
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

-- italics
vim.cmd([[
    let &t_ZH="\e[3m"
    let &t_ZR="\e[23m"
]])

-- gitgutter
g.gitgutter_map_keys = 0

-- Show relative line numbers only in active window
vim.api.nvim_create_augroup("RelativeLineNumbers", { clear = true })
vim.api.nvim_create_autocmd(
    { "WinEnter", "FocusGained" },
    {
        pattern = "*",
        command = "set relativenumber",
        group = "RelativeLineNumbers",
    }
)
vim.api.nvim_create_autocmd(
    { "WinLeave", "FocusLost" },
    {
        pattern = "*",
        command = "set norelativenumber",
        group = "RelativeLineNumbers",
    }
)

