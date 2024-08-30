-- load vim-plug plugins
vim.cmd [[
    call plug#begin(stdpath('data') . '/plugged')
        " the pope is the man
        Plug 'tpope/vim-sensible'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-commentary'

        " base
        Plug 'tomasiser/vim-code-dark'
        Plug 'jiangmiao/auto-pairs'             " auto-close '', (), {}...
        Plug 'christoomey/vim-tmux-navigator'

        " lit web components
        Plug 'jonsmithers/vim-html-template-literals'
        Plug 'pangloss/vim-javascript'
        Plug 'ap/vim-css-color'

        " misc
        Plug 'nvim-tree/nvim-web-devicons'      " icons for nvim-tree
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
        Plug 'windwp/nvim-ts-autotag'           " auto-close/-rename tags with Treesitter
        Plug 'nvim-lua/plenary.nvim'            " lua libs. required by many plugins
        Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
        Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
        Plug 'nvim-tree/nvim-tree.lua'          " file browser. NOT nvim-neo-tree!
        Plug 'nvim-lualine/lualine.nvim'        " vim-airline in lua
        Plug 'akinsho/bufferline.nvim', { 'tag': '*' } " buffers on top
    call plug#end()
]]

-- setup plugins
require('nvim-ts-autotag').setup()
require('nvim-tree').setup()
require('lualine').setup()
require('bufferline').setup({
    options = {
        numbers = true
    }
})
require('nvim-treesitter.configs').setup({
    highlight = {
        enable = true,
    }
})

-- install plugins when nvim starts
-- vim.cmd [[
--     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
-- ]]
