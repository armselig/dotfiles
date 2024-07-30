let loaded_netrw = 1                        " disable NetRW
let loaded_netrwPlugin = 1                  " disable NetRW

" PLUGINS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
    "Plug 'vim-airline/vim-airline'          " nicer status line
    "Plug 'ryanoasis/vim-devicons'           " icons for airline 
    Plug 'nvim-tree/nvim-web-devicons'      " icons for nvim-tree
    Plug 'jiangmiao/auto-pairs'             " auto-close '', (), {}...
    Plug 'Mofiqul/vscode.nvim'              " colorscheme vscode
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " syntax highlighting
    Plug 'windwp/nvim-ts-autotag'           " auto-close/-rename tags with Treesitter
    Plug 'nvim-lua/plenary.nvim'            " lua libs. required by many plugins
    Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
    Plug 'nvim-tree/nvim-tree.lua'          " file browser. NOT nvim-neo-tree!    
    Plug 'nvim-lualine/lualine.nvim'        " vim-airline in lua
    Plug 'akinsho/bufferline.nvim', { 'tag': '*' } " buffers on top
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
    Plug 'ThePrimeagen/vim-be-good'
call plug#end()


" OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent				                " activate auto indentation
set autoread				                " auto-reload files
set cc=80				                    " set column border
set clipboard=unnamed,unnamedplus           " activate clipboard sharing
set cursorline				                " highlight current line
set completeopt=noinsert,menuone,noselect   " auto-complete behaves more IDE-like
set expandtab				                " uses space for tabs
set hidden				                    " hide unused buffers
set inccommand=split			            " show replacements in split screen
set ignorecase				                " case insensitive matching
set mouse=a				                    " activate mouse support
set nobackup
set noswapfile
set nowrap
set number				                    " line numbers
set relativenumber			                " relative line numbers
set shiftwidth=4                            " indent size, should match tabstop
set showmatch
set smartcase                               " if search has uppercase, do not ignore
set smartindent
set softtabstop=4
set splitbelow splitright		            " new splits always below or to the right
set tabstop=4				                " default tab stop size
set termguicolors
set ttimeoutlen=0			                " time in ms to run commands
set wildmenu				                " more advanced auto-complete menu

colorscheme vscode
filetype plugin indent on		            " auto-indent based on filetype
syntax on				                    " syntax highlighting

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" NetRW file browser
let g:netrw_banner=0			            " hide top banner
let g:netrw_altv=1			                " switch display to left
let g:netrw_winsize=20			            " window size in percent
let g:netrw_liststyle=3                     " use tree view
let g:netrw_browse_split=4                  " open file in previous window

" launch NetRW on start
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END

" vim-airline
"let g:airline#extensions#tabline#enabled = 1 " Enable list of buffers on top
"let g:airline#extensions#tabline#buffer_nr_show = 1 " Show buffer index
"let g:airline_powerline_fonts = 1           " enable powerline/nerd fonts

" KEY BINDINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "                           " space is leader key

" Normal mode
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <A-Up> ddkP
nnoremap <A-Down> ddp
nnoremap <C-s> :w<CR>
"nnoremap <C-e> :NERDTreeFocus<CR>
"nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-f> :Telescope find_files<CR>
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>tt <cmd>NvimTreeToggle<CR>
nnoremap <leader>tf <cmd>NvimTreeFocus<CR>

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

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

local lspCfg = require('lspconfig')

lspCfg.html.setup({})
lspCfg.stylelint_lsp.setup({})
lspCfg.eslint.setup({})
EOF
