return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "yioneko/nvim-yati",
    },
    config = function()
      local configs = require("nvim-treesitter")

      configs.install({
        "bash",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "scss",
        "tsx",
        "typescript",
        "yaml",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
          if lang then
            vim.treesitter.start()
          end
        end,
      })
    end,
  },

  {
    "pearofducks/ansible-vim"
  }
}
