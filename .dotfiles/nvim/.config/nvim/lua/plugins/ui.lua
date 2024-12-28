return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      filters = { dotfiles = true }
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
    keys = {
      { "<leader>fe", "<cmd>NvimTreeFindFileToggle<CR>", mode = "n", desc = "Toggle NvimTree" }
    },
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
    opts = {
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
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", mode = "n", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",  mode = "n", desc = "Live grep" },
      { "<leader>fo", "<cmd>Telescope oldfiles<CR>",   mode = "n", desc = "Old files" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",  mode = "n", desc = "Help tags" },
      { "<leader>ls", "<cmd>Telescope buffers<CR>",    mode = "n", desc = "List buffers" },
      { "<leader>ma", "<cmd>Telescope marks<CR>",      mode = "n", desc = "List marks" }, },
  },

  -- Key binding hints
  { "folke/which-key.nvim", config = true },

  -- Diagnostics window
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
    config = true,
  },

  -- Start page
  { "mhinz/vim-startify" },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
