:call plug#begin('~/.config/local/share/nvim/site/autoload')

	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'hrsh7th/nvim-compe'

	Plug 'kabouzeid/nvim-lspinstall'
	Plug 'NightrainsRbx/RobloxLsp'
	Plug 'ryanoasis/vim-devicons'
	Plug 'sumneko/lua-language-server'
	
	Plug 'neovim/nvim-lspconfig'
	Plug 'sonph/onehalf', {'rtp':'vim'}
	Plug 'elvessousa/sobrio'
	Plug 'honza/vim-snippets'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-lualine/lualine.nvim'
    Plug 'andweeb/presence.nvim'
    Plug 'akinsho/bufferline.nvim'

	Plug 'preservim/nerdcommenter'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'williamboman/mason.nvim' 

	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	
	Plug 'rafamadriz/friendly-snippets'
	Plug 'windwp/nvim-autopairs'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

	Plug 'catppuccin/nvim'
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/sonokai'
    Plug 'junegunn/seoul256.vim'
    Plug 'https://github.com/sainnhe/everforest'

    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'vimlab/split-term.vim'
    Plug 'simrat39/rust-tools.nvim'
call plug#end()

set termguicolors

:luafile ~/.config/nvim/lua/plugins.lua

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

syntax on
set t_Co=256
"let g:sonokai_style= 'shusia'
let g:sonokai_style= 'espresso'
colorscheme sonokai

filetype plugin indent on 

set splitright
set splitbelow

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard+=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" My mappings
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>

nnoremap <M-w> :BufferNext<CR>
nnoremap <M-q> :BufferPrevious<CR>

nnoremap <F2> :%s//<CR>

imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

" Split window
nmap ss :split<Return><C-w>w 
nmap sv :vsplit<Return><C-w> 

" Move window
map sh <C-w>h
map sk <C-w>k  
map sj <C-w>j
map sl <C-w>l

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
