require("telescope").setup({
	pickers = {
		live_grep = {
			mappings = {
				n = { -- n 代表 Normal 模式
					["q"] = require("telescope.actions").close,
				},
			},
		},
	},
})

local map = vim.keymap.set

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope help tags" })

