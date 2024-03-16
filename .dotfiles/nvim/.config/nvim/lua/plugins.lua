local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer")
	.startup(function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		-- Color theme
		use("ellisonleao/gruvbox.nvim")

		-- LSP config
		use({
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		})

		-- null-ls
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})

		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("trouble").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section belo
				})
			end,
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})

		-- Treesitter indentation
		use({ "yioneko/nvim-yati", tag = "*", requires = "nvim-treesitter/nvim-treesitter" })

		-- Comments
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		-- Surround
		use("tpope/vim-surround")

		-- Repeat
		use("tpope/vim-repeat")

		-- File explorer
		use({
			"nvim-tree/nvim-tree.lua",
			-- requires = {
			-- 	"nvim-tree/nvim-web-devicons", -- optional, for file icons
			-- },
		})

		-- Statusline
		use({
			"nvim-lualine/lualine.nvim",
			config = function()
				require("lualine").setup({
					options = {
						theme = "gruvbox",
					},
				})
			end,
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-- Fuzzy finder
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.5",
			config = function()
				require("telescope").setup({
					pickers = {
						find_files = {
							find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
						},
					},
				})
			end,
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		-- Git Manager
		use({
			"tpope/vim-fugitive",
		})

		-- Git Signs
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup()
			end,
		})

		-- Auto pairs
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		})

		-- Auto tags
		use("windwp/nvim-ts-autotag")

		-- Completion
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("hrsh7th/cmp-nvim-lsp")

		-- Snippets
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		use("rafamadriz/friendly-snippets")

		-- Wiki
		use({
			"vimwiki/vimwiki",
			branch = "dev",
		})

		-- Startpage
		use("mhinz/vim-startify")

    use("pearofducks/ansible-vim")

    if packer_bootstrap then
      require('packer').sync()
    end
	end).sync()
