return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "yioneko/nvim-yati",
    },
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "scss",
        "typescript",
        "yaml",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = false,
      },
      autotag = {
        enable = true,
      },
      autopairs = {
        enable = false,
      },
      yati = {
        enable = true,
        default_lazy = true,
        default_fallback = "auto",
      },
    },
  },

  {
    "pearofducks/ansible-vim"
  }
}
