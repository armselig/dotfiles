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
        Plug 'airblade/vim-gitgutter'
        Plug 'stevearc/conform.nvim'            " formatting

        " lsp
        Plug 'neovim/nvim-lspconfig'
        Plug 'hrsh7th/nvim-cmp'
        Plug 'hrsh7th/cmp-nvim-lsp'
        Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v4.x'}
        Plug 'williamboman/mason.nvim'
        Plug 'williamboman/mason-lspconfig.nvim'
    call plug#end()
]]

-- setup plugins
require('plugins-lsp')
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

require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
    },
    format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    }
})

-- install plugins when nvim starts
-- vim.cmd [[
--     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
-- ]]
