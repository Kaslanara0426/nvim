-- vim.g.loaded_netrwPlugin = 1
require("yazi").setup({
  open_for_directories = false,
  keymaps = {
    show_help = "<f1>",
  },
})

local map = vim.keymap.set
map("n", "<leader>uu", "<cmd>Yazi<cr>", { desc = "Yazi: 在当前文件处打开" })
map("n", "<leader>ui", "<cmd>Yazi cwd<cr>", { desc = "Yazi: 在工作目录打开" })
map("n", "<leader>up", "<cmd>Yazi toggle<cr>", { desc = "Yazi: 恢复上次会话" })
