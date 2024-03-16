vim.opt.background = "dark"
local success, errmsg = pcall(function()
  vim.cmd([[colorscheme gruvbox]])
end)

if not success then
  print("Error applying gruvbox colorscheme:", errmsg)
end
