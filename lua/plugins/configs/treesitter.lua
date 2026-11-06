require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})
require("nvim-treesitter").install({
	"rust",
	"c",
	"lua",
	"go",
	"html",
	"css",
	"typescript",
	"tsx",
	"jsx",
	"javascript",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"lua",
		"c",
		"rust",
		"go",
		"html",
		"css",
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
	},
	callback = function()
		vim.treesitter.start()
	end,
})

-- 将 typescriptreact 文件类型映射到 tsx 解析器
vim.treesitter.language.register("tsx", "typescriptreact")
-- 如果 jsx 解析器有问题，也可以显式映射
vim.treesitter.language.register("jsx", "javascriptreact")
