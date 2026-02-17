local map = vim.keymap.set
local default_opts = { silent = true, noremap = true }

-- Esc
map("i", "jj", "<Esc>", {})

-- Copy/Paste
map("v", "<leader>y", '"*y', default_opts)
map("n", "<leader>p", '"*p', default_opts)

-- Buffers
map("n", "<c-n>", "<cmd>bnext<CR>", default_opts)
map("n", "<c-p>", "<cmd>bprev<CR>", default_opts)
-- map("n", "<leader>d", ":bd<CR>", default_opts) # TODO: This clashes with Telescope
map("n", "<leader>b", ":b#|bd#<CR>", default_opts)

-- Windows
map("n", "<leader>q", ":q<CR>", default_opts)
map("n", "<leader>w", ":w<CR>", default_opts)

-- Save
vim.cmd("com! W w")
vim.cmd("com! Wq wq")
vim.cmd("com! WQ wq")

-- Sort
map("v", "<F9>", ":sort<CR>", default_opts)

-- Telescope grep: two separate keymaps for with/without aider history
-- Regular grep EXCLUDING aider chat history (normal use)
map("n", "<leader>fg", function()
  require('telescope.builtin').live_grep({
    additional_args = function()
      return { "--glob=!*.aider.chat.history.*", "--glob=!**/.aider/*" }
    end
  })
end, { desc = "Live grep (exclude aider)" })

-- Grep INCLUDING aider chat history (when you need to search history)
map("n", "<leader>fG", function()
  require('telescope.builtin').live_grep()
end, { desc = "Live grep (include all)" })
