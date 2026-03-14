return {
  -- GitHub Copilot
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   keys = {
  --     { "<C-J>", "copilot#Accept(\"\\<CR>\")", expr = true, replace_keycodes = false,            mode = "i", desc = "Accept Copilot suggestion" },
  --     { "<M-]>", "<Plug>(copilot-next)",       mode = "i",  desc = "Next Copilot suggestion" },
  --     { "<M-[>", "<Plug>(copilot-previous)",   mode = "i",  desc = "Previous Copilot suggestion" },
  --   },
  --   init = function()
  --     vim.g.copilot_no_tab_map = true
  --   end,
  -- },
  -- LLM
  {
    "huggingface/llm.nvim",
    opts = {
      backend = "ollama",
      model = "qwen3.5:2b",
      url = "http://localhost:11434",
      tokens_to_clear = { "```python", "```", "<|fim_prefix|>", "<|fim_suffix|>", "<|fim_middle|>" },
      fim = {
        enabled = true,
        prefix = "<|fim_prefix|>",
        middle = "<|fim_middle|>",
        suffix = "<|fim_suffix|>",
      },
      context_window = 8192,
      tokenizer = nil,
      request_body = {
        options = {
          temperature = 0.1,
          num_predict = 30,
        },
        think = false, -- suppress Qwen3.5 thinking mode
      },
      accept_keymap = "<Tab>",
      dismiss_keymap = "<S-Tab>",
    },
  },
  -- Comment.nvim
  {
    'numToStr/Comment.nvim',
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        opts = {
          enable_autocmd = false,
        },
      },
    },
    opts = function()
      return {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
}
