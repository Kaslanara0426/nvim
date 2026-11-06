-- 主题
require("tokyonight").setup({
	style = "moon",
	transparent = true, -- 背景透明，露出终端背景
	on_highlights = function(hl, c)
		-- 1. 干掉所有浮动窗口的底色和边框色（防止出现纯黑/深灰的底）
		hl.NormalFloat = { bg = "NONE" }
		hl.FloatBorder = { bg = "NONE", fg = "NONE" }

		-- 2. Telescope 主体
		hl.TelescopeNormal = { bg = "NONE" }
		hl.TelescopeBorder = { bg = "NONE", fg = "NONE" } -- 把边框前景色也去掉试试

		-- 3. Telescope 输入框（Prompt，也就是有 ">" 的那一行）
		hl.TelescopePromptNormal = { bg = "NONE" }
		hl.TelescopePromptBorder = { bg = "NONE", fg = "NONE" }

		-- 4. Telescope 标题（比如 "Live Grep" 旁边的线）
		hl.TelescopePromptTitle = { bg = "NONE", fg = c.blue } -- 保留字颜色，去掉底色
		hl.TelescopeResultsTitle = { bg = "NONE", fg = c.blue }
	end,
})
vim.cmd.colorscheme("tokyonight")

-- 底行
require("lualine").setup({})

-- 列
require("ibl").setup({
	indent = { char = "▎" },
	scope = { show_start = false, show_end = false },
	exclude = {
		filetypes = { "help", "dashboard", "NvimTree", "Trouble" },
	},
})
