local null_ls_require_ok, null_ls = pcall(require, "null-ls")

if not null_ls_require_ok then
  return
end

-- register any number of sources simultaneously
-- NOTE: Had to remove styleua

-- local sources = {
-- 	null_ls.builtins.formatting.prettier,
-- 	null_ls.builtins.formatting.yamlfmt,
-- 	null_ls.builtins.formatting.black,
--   null_ls.builtins.diagnostics.shellcheck,
--   null_ls.builtins.diagnostics.ansiblelint
-- }
--
-- local lsp_formatting = function(bufnr)
-- 	vim.lsp.buf.format({
-- 		filter = function(client)
-- 			-- apply whatever logic you want (in this example, we'll only use null-ls)
-- 			return client.name == "null-ls"
-- 		end,
-- 		bufnr = bufnr,
-- 		async = true,
-- 	})
-- end
--
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--
-- local on_attach = function(client, bufnr)
-- 	if client.supports_method("textDocument/formatting") then
-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
-- 		vim.api.nvim_create_autocmd("BufWritePre", {
-- 			group = augroup,
-- 			buffer = bufnr,
-- 			callback = function()
-- 				lsp_formatting(bufnr)
-- 			end,
-- 		})
-- 	end
-- end
--
-- null_ls.setup({
-- 	sources = sources,
-- 	on_attach = on_attach,
-- })
