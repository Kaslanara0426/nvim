-- 可以对驼峰单词进行motion

vim.keymap.set({ "n", "o", "x" }, "<leader>w", "<cmd>lua require('spider').motion('w')<CR>")
vim.keymap.set({ "n", "o", "x" }, "<leader>e", "<cmd>lua require('spider').motion('e')<CR>")
vim.keymap.set({ "n", "o", "x" }, "<leader>b", "<cmd>lua require('spider').motion('b')<CR>")
vim.keymap.set({ "n", "o", "x" }, "<leader>ge", "<cmd>lua require('spider').motion('ge')<CR>")

vim.pack.add ({
  { src = "https://github.com/chrisgrieser/nvim-spider"}
})

-- default values
require("spider").setup {
	skipInsignificantPunctuation = true,
	subwordMovement = true,
	consistentOperatorPending = false, -- see the README for details
	customPatterns = {}, -- see the README for details
}

