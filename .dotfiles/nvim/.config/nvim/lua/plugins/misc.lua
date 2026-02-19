return {
  -- GitHub Copilot
  {
    "github/copilot.vim",
    lazy = false,
    keys = {
      { "<C-J>", "copilot#Accept(\"\\<CR>\")", expr = true, replace_keycodes = false,            mode = "i", desc = "Accept Copilot suggestion" },
      { "<M-]>", "<Plug>(copilot-next)",       mode = "i",  desc = "Next Copilot suggestion" },
      { "<M-[>", "<Plug>(copilot-previous)",   mode = "i",  desc = "Previous Copilot suggestion" },
    },
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
  },
}
