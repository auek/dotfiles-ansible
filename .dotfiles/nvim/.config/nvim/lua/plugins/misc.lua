return {
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
