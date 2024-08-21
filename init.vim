" import vim settings
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

" Source the .vimrc file
if filereadable(expand('~/.vimrc'))
  source ~/.vimrc
  echo 'Sourced .vimrc'
endif

" disable NetRW
let loaded_netrw = 1 
let loaded_netrwPlugin = 1 

" Check if vim-plug is installed and install it if necessary
function! CheckAndInstallVimPlug()
  " Define the path to the vim-plug autoload directory for Neovim
  let plug_install_dir = expand('~/.local/share/nvim/site/autoload/plug.vim')

  " Check if the plug.vim file exists
  if !filereadable(plug_install_dir)
    " Print a message to inform the user
    echo "vim-plug not found. Installing vim-plug..."

    " Use system() to run the shell command to download vim-plug
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    " Print a message to inform the user that vim-plug has been installed
    echo "vim-plug installed successfully."
  endif
endfunction

" Call the function to check and install vim-plug
call CheckAndInstallVimPlug()

" PLUGINS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
" call plug#begin('~/.vim/plugged')
    " the pope is the man
    " Plug 'tpope/vim-sensible'
    " Plug 'tpope/vim-fugitive'
    " Plug 'tpope/vim-surround'
    " Plug 'tpope/vim-commentary'

    " Plug 'tomasiser/vim-code-dark'
    " Plug 'jiangmiao/auto-pairs'             " auto-close '', (), {}...
    " Plug 'christoomey/vim-tmux-navigator'

    " lit web components
    " Plug 'jonsmithers/vim-html-template-literals'
    " Plug 'pangloss/vim-javascript'
    " Plug 'ap/vim-css-color'

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

" Ensure all plugins are installed
" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

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
