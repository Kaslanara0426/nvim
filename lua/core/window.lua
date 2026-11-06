-- 定义窗口移动快捷键 <leader>w + h/j/k/l
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "向左切换窗口" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "向下切换窗口" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "向上切换窗口" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "向右切换窗口" })

-- 2. 创建分屏 (Split)
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "窗口: 水平分屏 (上下)" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "窗口: 垂直分屏 (左右)" })
vim.keymap.set("n", "<leader>wn", "<C-w>n", { desc = "窗口: 新建窗口" })

-- 3. 关闭窗口 (Quit/Close)
vim.keymap.set("n", "<leader>wq", "<C-w>c", { desc = "窗口: 关闭当前窗口" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "窗口: 关闭其他所有窗口 (Only)" })

-- 4. 调整窗口大小 (Resize) 
-- 使用 = 均衡大小，+/- 调整高度，>/< 调整宽度 (按住可以连续调整)
vim.keymap.set("n", "<leader>w=", "<C-w>=", { desc = "窗口: 平衡所有窗口大小" })
vim.keymap.set("n", "<leader>w+", "5<C-w>+", { desc = "窗口: 增加高度" })
vim.keymap.set("n", "<leader>w-", "5<C-w>-", { desc = "窗口: 减少高度" })
vim.keymap.set("n", "<leader>w>", "5<C-w>>", { desc = "窗口: 增加宽度" })
vim.keymap.set("n", "<leader>w<", "5<C-w><", { desc = "窗口: 减少宽度" })

-- 5. 交换/移动窗口位置 (Move Window)
-- 注意：这里是大写的 H/J/K/L，用于把当前窗口挪到边缘
vim.keymap.set("n", "<leader>wH", "<C-w>H", { desc = "窗口: 移到最左边" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { desc = "窗口: 移到最下边" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { desc = "窗口: 移到最上边" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { desc = "窗口: 移到最右边" })
vim.keymap.set("n", "<leader>wx", "<C-w>x", { desc = "窗口: 与下一个窗口交换位置" })
