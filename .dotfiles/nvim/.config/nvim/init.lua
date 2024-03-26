local map = vim.api.nvim_set_keymap

-- Leader
map("n", " ", "", {})
vim.g.mapleader = " "

-- Clipboard
if vim.fn.has("wsl") then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

require("plugins")
require("opts")
require("keys")
