require('colorizer').setup()
require('bufferline').setup()
require('telescope').load_extension('fzf')

require('nvim-treesitter.configs').setup{
    highlight = {enable=true},
}

require('lualine').setup()
require'nvim-tree'.setup()
require ('nvim-autopairs').setup{}

local cmp = require('cmp')

-- making sure that the autocomplete uses the vsnip engine
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {},
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'vsnip'},
    }, {
        {name = 'buffer'},
    })
})

require("mason").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

lspconfig['sumneko_lua'].setup{
    capabilities = capabilities
}

lspconfig.clangd.setup{
    capabilities = capabilities
}
lspconfig.gopls.setup{
    capabilities = capabilities
}

require("catppuccin").setup{
    integrations={
        treesitter=true
    },
}
