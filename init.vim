" import vim settings
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" disable NetRW
let loaded_netrw = 1 
let loaded_netrwPlugin = 1 

" PLUGINS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('$HOME/.vim/plugged')
    " the pope is the man
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    Plug 'tomasiser/vim-code-dark'
    Plug 'jiangmiao/auto-pairs'             " auto-close '', (), {}...

    " lit web components
    Plug 'jonsmithers/vim-html-template-literals'
    Plug 'pangloss/vim-javascript'
    Plug 'ap/vim-css-color'

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


" OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set inccommand=split			            " show replacements in split screen

" KEY BINDINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" files: find
nnoremap <leader>ff <cmd>Telescope find_files<CR>
" files: grep
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
" files: browse
nnoremap <leader>fb <cmd>NvimTreeToggle<CR>

" EVERYTHING LUA """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
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
EOF
