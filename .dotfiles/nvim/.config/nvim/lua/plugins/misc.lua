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
      backend = "openai",
      model = "gemini-2.5-flash-lite",
      url = "https://generativelanguage.googleapis.com/v1beta/openai/v1/completions",
      disable_url_path_completion = true,
      api_token = os.getenv("GEMINI_API_KEY"),
      url_to_header = function(url, api_token)
        return { Authorization = "Bearer " .. api_token }
      end,
      tokens_to_clear = { "```", "<|fim_prefix|>", "<|fim_suffix|>", "<|fim_middle|>" },
      fim = {
        enabled = true,
        prefix = "<|fim_prefix|>",
        middle = "<|fim_middle|>",
        suffix = "<|fim_suffix|>",
      },
      context_window = 1024,
      request_body = {
        temperature = 0.1,
        max_tokens = 64,
      },
      debounce_ms = 150,
      accept_keymap = "<Tab>",
      dismiss_keymap = "<S-Tab>",
      lsp = {
        cmd_env = {
          LLM_LOG_LEVEL = "DEBUG",
          LLM_LOG_FILE = vim.fn.expand("~/.cache/nvim/llm-ls.log"),
        },
      },
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
