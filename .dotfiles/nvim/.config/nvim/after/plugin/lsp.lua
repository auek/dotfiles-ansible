local mason_require_ok, mason = pcall(require, "mason")
local mason_lspconfig_require_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
local lsp_zero_require_ok, lsp_zero = pcall(require, "lsp-zero")

if lsp_zero_require_ok then
  lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ bufnr = bufnr })
  end)
end

if mason_require_ok then
  mason.setup({})
end

if mason_lspconfig_require_ok then
  mason_lspconfig.setup({
    ensure_installed = { 'bashls', 'ts_ls', 'lua_ls', 'eslint', 'yamlls', 'ansiblels', 'astro' },
    handlers = {
      lsp_zero.default_setup,
      lua_ls = function()
        require('lspconfig').lua_ls.setup({
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  'vim',
                },
              },
            },
          },
        })
      end
    },
  })
end
