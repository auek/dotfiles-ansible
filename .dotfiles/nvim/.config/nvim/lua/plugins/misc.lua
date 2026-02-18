return {
  -- CodeGPT with OpenRouter
  {
    "dpay/codegpt.nvim",
    cmd = { "CodeGPT", "Chat" },
    build = "go build",
    config = function()
      require("codegpt").setup({
        openai_api_key = os.getenv("OPENROUTER_API_KEY"),
        openai_api_provider = "openrouter",
      })
    end,
    keys = {
      { "<leader>ai", "<cmd>CodeGPT<cr>", desc = "Open CodeGPT" },
    },
  },
}
