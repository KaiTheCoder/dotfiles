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
	Plug 'romgrk/barbar.nvim'
	Plug 'kyazdani42/nvim-tree.lua'
	Plug 'nvim-lualine/lualine.nvim'
    Plug 'andweeb/presence.nvim'

	Plug 'preservim/nerdcommenter'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'williamboman/nvim-lsp-installer'

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
call plug#end()

lua <<EOF

    require('telescope').load_extension('fzf')

    require('nvim-treesitter.configs').setup{
        highlight = {enable=true}
    }

    

    require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'gruvbox',
            component_seperators = {},
            section_seperators = {},
            disabled_filetypes = {},
            always_divide_middle = true,
        },

        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}

        },

        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {},

        },

        tabline = {},
        extensions = {},

    }
    

require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
EOF

lua << EOF
	require('nvim-autopairs').setup{}

	local cmp_autopairs = require('nvim-autopairs.completion.cmp')
	local cmp = require'cmp'
	cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
		map_char = {tex = ''}
	}))

	cmp.setup({

		snippet = {

			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body)
			end
		},

		sources = cmp.config.sources({
			{name='nvim_lsp'},
			{name = 'vsnip'},
		}, {{name="buffer"}}
		),
		
		mapping={
			['<CR>'] = cmp.mapping.confirm({select = true})
		}
	})

	local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

	require('lspconfig')['pyright'].setup {
		capabilities = capabilities
	}

	require('lspconfig')['sumneko_lua'].setup{
		capabilities = capabilities
	}

    require("catppuccin").setup({
        integrations={
            treesitter=true
        },
    })
	
EOF

set termguicolors
set background=dark
colorscheme gruvbox

filetype plugin indent on 
syntax on

set t_Co=256

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
