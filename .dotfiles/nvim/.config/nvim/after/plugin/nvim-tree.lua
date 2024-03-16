-- File explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local nvim_tree_require_ok, nvim_tree = pcall(require, 'nvim-tree')
-- with default setup
if nvim_tree_require_ok then
  nvim_tree.setup {
      filters = {
          dotfiles = true,
      }
  }
end
