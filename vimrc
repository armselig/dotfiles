" PLUGINS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
    Plug 'vim-airline/vim-airline'          " nicer status line
    Plug 'ryanoasis/vim-devicons'           " font icons in the interface
    Plug 'jiangmiao/auto-pairs'             " auto-close '', (), {}...
call plug#end()

" OPTIONS """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent				                " activate auto indentation
set autoread				                " auto-reload files
set background=dark
set cc=80				                    " set column border
set clipboard=unnamedplus		            " activate clipboard sharing
set cursorline				                " highlight current line
set completeopt=noinsert,menuone,noselect   " auto-complete behaves more IDE-like
set expandtab				                " uses space for tabs
set hidden				                    " hide unused buffers
set ignorecase				                " case insensitive matching
set mouse=a				                    " activate mouse support
set number				                    " line numbers
set nobackup
set nocompatible
set noswapfile
set nowrap
set path+=**                                " add subfolders to path for better search
set relativenumber			                " relative line numbers
set shiftwidth=4                            " indent size, should match tabstop
set showmatch
set smartcase
set smartindent
set softtabstop=4
set splitbelow splitright		            " new splits always below or to the right
set tabstop=4				                " default tab stop size
set termguicolors
set ttimeoutlen=0			                " time in ms to run commands
set wildmenu				                " more advanced auto-complete menu

colorscheme codedark
filetype plugin indent on		            " auto-indent based on filetype
syntax on				                    " syntax highlighting

" Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" NetRW file browser
"let g:netrw_banner=0			            " hide top banner
let g:netrw_altv=1			                " switch display to left
let g:netrw_winsize=25			            " window size is max 25%
let g:netrw_liststyle=3                     " treeview 
let g:netrw_browse_split=4                  " open file in previous window

" vim-airline
let g:airline#extensions#tabline#enabled = 1 " Enable list of buffers on top
let g:airline#extensions#tabline#buffer_nr_show = 1 " Show buffer index
let g:airline_powerline_fonts = 1           " enable powerline/nerd fonts

" KEY BINDINGS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "

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

