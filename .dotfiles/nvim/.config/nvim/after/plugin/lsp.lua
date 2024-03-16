local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
	-- client.resolved_capabilities.document_formatting = false
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	--[[
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
  --]]
	--
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	-- vim.keymap.set("n", "<leader>f", function()
	-- 	vim.lsp.buf.format({ async = true })
	-- end, bufopts)
end

-- Set up lspconfig.
--
--
--
--
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()
require("mason-lspconfig").setup()

-- require("lspconfig").sumneko_lua.setup({
-- 	on_attach = on_attach,
-- 	settings = {
-- 		Lua = {
-- 			diagnostics = {
-- 				globals = { "vim", "require" },
-- 			},
-- 		},
-- 	},
-- 	capabilities = capabilities,
-- })

-- require("lspconfig").tsserver.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

-- TODO: Remove?
-- require("lspconfig").cssmodules_ls.setup({
-- 	on_attach = on_attach
-- 	capabilities = capabilities,
-- })

require("lspconfig").jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- require("lspconfig").eslint.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

-- require("lspconfig").stylelint_lsp.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

-- require("lspconfig").tailwindcss.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

require("lspconfig").yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- require("lspconfig").ansiblels.setup{
--   filetypes = {
--     "ansible.yaml",
--   },
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- }

require("lspconfig").pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

