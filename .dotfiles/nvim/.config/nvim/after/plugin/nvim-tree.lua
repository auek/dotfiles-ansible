-- File explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- with default setup
require('nvim-tree').setup {
    filters = {
        dotfiles = true,
    }
}
