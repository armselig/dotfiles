" This configuration is also sourced by nvim
" Function to check if vim-plug is installed and install it if necessary
function! CheckAndInstallVimPlug()
  " Define the path to the vim-plug autoload directory
  let plug_install_dir = expand('~/.vim/autoload/plug.vim')

  " Check if the plug.vim file exists
  if !filereadable(plug_install_dir)
    " Print a message to inform the user
    echo "vim-plug not found. Installing vim-plug..."

    " Use system() to run the shell command to download vim-plug
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    " Print a message to inform the user that vim-plug has been installed
    echo "vim-plug installed successfully."
  endif
endfunction

" Call the function to check and install vim-plug
call CheckAndInstallVimPlug()

" PLUGINS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
    " the pope is the man
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'

    Plug 'tomasiser/vim-code-dark'
    Plug 'jiangmiao/auto-pairs'             " auto-close '', (), {}...
    Plug 'christoomey/vim-tmux-navigator'

    " lit web components
    Plug 'jonsmithers/vim-html-template-literals'
    Plug 'pangloss/vim-javascript'
    Plug 'ap/vim-css-color'

    " vim-only plugins
    if !has('nvim')
        Plug 'vim-airline/vim-airline'          " nicer status line
        Plug 'ryanoasis/vim-devicons'           " font icons in the interface
    endif
call plug#end()

" OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent				                " activate auto indentation
set cc=80				                    " set column border
set clipboard=unnamed,unnamedplus		    " activate clipboard sharing
set cursorline				                " highlight current line
set completeopt=noinsert,menuone,noselect   " auto-complete behaves more IDE-like
set expandtab				                " uses space for tabs
set hidden				                    " hide unused buffers
set ignorecase				                " case insensitive matching
set mouse=a				                    " activate mouse support
set number				                    " line numbers
set nobackup
set noswapfile
set nowrap
set path+=**                                " add subfolders to path for better search
set relativenumber			                " relative line numbers
set scrolloff=999                           " try to keep cursor centered
set shiftwidth=4                            " indent size, should match tabstop
set showmatch
set smartcase
set smartindent
set softtabstop=4
set splitbelow splitright		            " new splits always below or to the right
set t_Co=256
set tabstop=4				                " default tab stop size

colorscheme codedark
filetype plugin indent on		            " auto-indent based on filetype
syntax on				                    " syntax highlighting

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" NetRW file browser
let g:netrw_banner=0			            " hide top banner
let g:netrw_altv=1			                " switch display to left
let g:netrw_winsize=25			            " window size is max 25%
let g:netrw_liststyle=3                     " treeview 
let g:netrw_browse_split=4                  " open file in previous window

if !has('nvim')
    " vim-airline
    let g:airline#extensions#tabline#enabled = 1 " Enable list of buffers on top
    let g:airline#extensions#tabline#buffer_nr_show = 1 " Show buffer index
    let g:airline_powerline_fonts = 1           " enable powerline/nerd fonts
endif

" KEY BINDINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<Space>"

" source .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
" move line up
nnoremap <A-Up> ddkP
" move line down
nnoremap <A-Down> ddp
" save file
nnoremap <C-s> :w<CR>
" half page up and center
nnoremap <C-u> <C-u>zz
" half page down and center
nnoremap <C-d> <C-d>zz
" files: browse - toggle vertical NetRW
nnoremap <leader>fb :Vex<CR>
" files: find
nnoremap <leader>ff :find 
" close buffer
nnoremap <C-q> :bd<CR>
" toggle terminal
map <leader>t :horizontal term<CR>i

" VIMSCRIPT """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

