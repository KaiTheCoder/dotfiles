vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- Ensure packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

packer.init({
	package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

packer.startup(function()
	local use = use
	-- plugins go here
	
	-- Syntax highlighting
	  use {
    	'nvim-treesitter/nvim-treesitter',
      run = function()
        	local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      		ts_update()
      end,
    }

	use 'sheerun/vim-polyglot'

	-- Color scheme
	use({'rose-pine/neovim', as = 'rose-pine'})

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'anott03/nvim-lspinstall'

	-- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'	
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

	-- make neovim look cooler
	use {'prettier/vim-prettier', run = 'yarn install'}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

	end
)

-- Make neovim prettier 
require('rose-pine').setup()
vim.cmd('colorscheme rose-pine')

require('lualine').setup()

-- Setting up syntax highlighting with treesitter
require'nvim-treesitter.configs'.setup({
	ensure_installed = {"c", "lua", "vim", "python", "rust"},
	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true
	},
})

-- Set up file explorer
require'nvim-tree'.setup()


-- Setting up autocompletion
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

  -- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.pyright.setup{
	capabilities = capabilities
}

lspconfig.sourcekit.setup{
  capabilities = capabilities
}


-- Finally, some mappings
vim.cmd("nnoremap <C-n> :NvimTreeToggle<CR>")
vim.cmd("nnoremap <C-q> :q<CR>")
vim.cmd("nnoremap <C-s> :w<CR>")

vim.cmd("nnoremap <M-w> :BufferNext<CR>")
vim.cmd("nnoremap <M-q> :BufferPrevious<CR>")

vim.cmd("nnoremap <F2> :%s//<CR>")

vim.cmd("imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'")
vim.cmd("imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'")

-- Switch tab
vim.cmd("nmap <S-Tab> :tabprev<Return>")
vim.cmd("nmap <Tab> :tabnext<Return>")

-- For local replace
vim.cmd("nnoremap gr gd [{V%::s/<C-R>///gc<left><left><left>")

-- For global replace 
vim.cmd("nnore map gR gD:%s/<C-R>///gc<left><left><left>")
