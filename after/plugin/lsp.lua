-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)


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
        ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
    }),
})

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {'pyright', 'rust_analyzer'},
  handlers = {
    lsp.default_setup,
  },
})
