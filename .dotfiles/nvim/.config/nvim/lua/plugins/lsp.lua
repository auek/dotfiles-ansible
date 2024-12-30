return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    -- LSP Support
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  init = function()
    local lsp_zero = require("lsp-zero")

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "bashls",
        "ts_ls",
        "lua_ls",
        "eslint",
        "yamlls",
        "ansiblels",
        "astro",
      },
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          require("lspconfig").lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      },
    })
  end,
  keys = {
    { "gd",         "<cmd>lua vim.lsp.buf.definition()<CR>",    mode = "n",          desc = "Go to definition" },
    { "gD",         "<cmd>lua vim.lsp.buf.declaration()<CR>",   mode = "n",          desc = "Go to declaration" },
    { "gh",         function() return vim.lsp.buf.hover() end,  desc = "Hover" },
    { "<leader>ca", vim.lsp.buf.code_action,                    mode = { "n", "v" }, desc = "Code Action" },
    { "<leader>cr", vim.lsp.buf.rename,                         desc = "Rename", },
    { "[d",         "<cmd>lua vim.diagnostic.goto_prev()<CR>",  mode = "n",          desc = "Previous diagnostic" },
    { "]d",         "<cmd>lua vim.diagnostic.goto_next()<CR>",  mode = "n",          desc = "Next diagnostic" },
    { "<leader>d",  "<cmd>lua vim.diagnostic.open_float()<CR>", mode = "n",          desc = "Open diagnostics" },
  }
}
