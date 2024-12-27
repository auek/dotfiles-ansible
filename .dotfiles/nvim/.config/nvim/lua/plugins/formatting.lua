return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "styleua" },
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          typescriptreact = { "prettierd" },
          javascriptreact = { "prettierd" },
          css = { "prettierd" },
          html = { "prettierd" },
          json = { "prettierd" },
          astro = { "prettierd" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
      })
    end
  },

  -- Auto pairs and tags
  { "windwp/nvim-autopairs", config = true },

  -- Comments
  { "numToStr/Comment.nvim", config = true },

  -- Surround
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },
}
