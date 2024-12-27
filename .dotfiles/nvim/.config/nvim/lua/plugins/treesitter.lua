return {
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
}
