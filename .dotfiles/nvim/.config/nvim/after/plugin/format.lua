local conform_require_ok, conform = pcall(require, "conform")

-- formatters prettierd and styleua needs to be manually installed with :Mason
if conform_require_ok then
  conform.setup({
    formatters_by_ft = {
      lua = { "styleua" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      javascriptreact = { "prettierd" },
      css = { "prettierd" },
      html = { "prettierd" },
      json = { "prettierd" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 500,
    },
  })
end
