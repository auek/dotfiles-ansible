return {
  -- GitHub Copilot
  {
    "github/copilot.vim",
    lazy = false,
    keys = {
      { "<C-J>", "copilot#Accept(\"\\<CR>\")", expr = true, replace_keycodes = false, mode = "i", desc = "Accept Copilot suggestion" },
      { "<M-]>", "<Plug>(copilot-next)",       mode = "i",  desc = "Next Copilot suggestion" },
      { "<M-[>", "<Plug>(copilot-previous)",   mode = "i",  desc = "Previous Copilot suggestion" },
    },
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
  },
  -- CodeCompanion with OpenRouter
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        adapters = require("codecompanion.adapters").extend("openai", {
          name = "openrouter",
          url = "https://openrouter.ai/api/v1",
          model = "openai/gpt-4o-mini",
          api_key_name = "OPENROUTER_API_KEY",
        }),
      })
    end,
    keys = {
      { "<leader>ai", "<cmd>CodeCompanionChat<cr>", desc = "Open CodeCompanion Chat" },
      { "<leader>aa", "<cmd>CodeCompanionAction<cr>", desc = "CodeCompanion Action" },
    },
  },
}
