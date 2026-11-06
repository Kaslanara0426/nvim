local load = {
	-- 补全
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") },
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },

	-- 查找
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },

	-- 格式化
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- 按键分析
	{ src = "https://github.com/meznaric/key-analyzer.nvim" },

	-- LSP
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },

	-- 语法树 / 文本对象
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
	{ src = "https://github.com/aaronik/treewalker.nvim" },

	-- 多光标
	{ src = "https://github.com/jake-stewart/multicursor.nvim", version = "1.0" },

	-- 终端
	{ src = "https://github.com/akinsho/toggleterm.nvim", version = vim.version.range("*") },

	-- 界面
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/HiPhish/rainbow-delimiters.nvim" },

	-- 文件管理
	{ src = "https://github.com/mikavilpas/yazi.nvim", version = vim.version.range("*") },

  { src = "https://github.com/akinsho/bufferline.nvim", version = "main" }
}

vim.pack.add(load)

