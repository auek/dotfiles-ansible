return {
  -----------------------------------------------------------
  -- Essential Plugins
  -----------------------------------------------------------
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      local success, errmsg = pcall(function()
        vim.cmd([[colorscheme gruvbox]])
      end)
      if not success then
        vim.notify("Error applying gruvbox colorscheme: " .. errmsg, vim.log.levels.ERROR)
      end
    end
  },

  -- GitHub Copilot
  { "github/copilot.vim",    lazy = false },

  -----------------------------------------------------------
  -- LSP and Completion
  -----------------------------------------------------------
  {
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
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ bufnr = bufnr })
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "ts_ls",
          "lua_ls",
          "eslint",
          "yamlls",
          "ansiblels",
          "astro"
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
    end
  },

  -- Completion setup
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- Helper function for super tab functionality
      local has_words_before = function()
        ---@diagnostic disable-next-line: deprecated
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
            max_width = 80,
            max_height = 20,
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          -- Super Tab mappings
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "copilot" }
        })
      })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -----------------------------------------------------------
  -- Code Formatting and Editing
  -----------------------------------------------------------
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

  -----------------------------------------------------------
  -- Treesitter and Syntax
  -----------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "yioneko/nvim-yati",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        auto_install = true,
        autotag = { enable = true },
        yati = {
          enable = true,
          default_lazy = true,
          default_fallback = "auto",
        },
        indent = { enable = false },
        highlight = { enable = true },
      })
    end
  },

  -- Ansible support
  { "pearofducks/ansible-vim" },

  -----------------------------------------------------------
  -- UI and Navigation
  -----------------------------------------------------------
  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      require("nvim-tree").setup({
        filters = { dotfiles = true }
      })
    end
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "gruvbox" }
      })
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            find_command = {
              "rg",
              "--files",
              "--hidden",
              "--glob", "!**/.git/*",
              "--glob", "!**/node_modules/*"
            },
          },
          live_grep = {
            additional_args = function()
              return {
                "--hidden",
                "--glob", "!**/.git/*",
                "--glob", "!**/node_modules/*"
              }
            end,
          },
        },
      })
    end,
  },

  -- Key binding hints
  { "folke/which-key.nvim",   config = true },

  -- Diagnostics window
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = true,
  },

  -- Start page
  { "mhinz/vim-startify" },

  -----------------------------------------------------------
  -- Git Integration
  -----------------------------------------------------------
  { "tpope/vim-fugitive" },
  { "lewis6991/gitsigns.nvim", config = true },

  -----------------------------------------------------------
  -- Markdown
  -----------------------------------------------------------
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
}
