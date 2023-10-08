-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

local cmp = require("cmp")

cmp.setup({
    sources = {
        {name='nvim_lsp'},
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
})
