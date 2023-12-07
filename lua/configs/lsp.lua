lspconfig = require('lspconfig')
configs = require('lspconfig.configs')
util = require('lspconfig/util')

require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
    gopls = {
        filetypes = {"go", "gomod"},
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
            gopls = {
              analyses = {
                  unusedparams = true,
              },
              staticcheck = true,
            },
        },
    },
    helm_ls = {
        filetypes = {'helm'},
    },
    terraformls = {},
    jsonls = {},
    tsserver = {},
    bashls = {},
    jsonnet_ls = {},
    pyright = {},
    kotlin_language_server = {},
    --java_language_server = {},
    lua_ls = {},
    rust_analyzer = {},
}

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
