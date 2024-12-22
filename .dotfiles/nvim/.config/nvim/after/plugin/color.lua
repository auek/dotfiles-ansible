vim.opt.background = "dark"
local success, errmsg = pcall(function()
  vim.cmd([[colorscheme gruvbox]])
end)

if not success then
  vim.notify("Error applying gruvbox colorscheme: " .. errmsg, vim.log.levels.ERROR)
  return
end
