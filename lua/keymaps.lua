vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "gl", "$")
vim.keymap.set("n", "gh", "^")

-- ============================================================
-- Neovim 窗口分割与导航快捷键增强
-- ============================================================

-- 1. 窗口分割
-- <leader>sv：垂直分割（左右） -> 对应 :vsplit
-- <leader>sh：水平分割（上下） -> 对应 :split
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "垂直分割窗口" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "水平分割窗口" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "让所有窗口大小相等" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "关闭当前窗口" })

-- 2. 窗口跳转（告别 <C-w>h/j/k/l）
-- 使用 <C-h/j/k/l> 在窗口间快速跳转
-- 注意：如果你的终端或 tmux 也绑定了这些键，可能需要调整
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "跳转到左侧窗口" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "跳转到下方窗口" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "跳转到上方窗口" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "跳转到右侧窗口" })

-- 3. 窗口大小调整（告别 <C-w>+/-/>/<）
-- 使用 <C-方向键> 调整窗口大小，每次调整 2 行/列
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "减小窗口高度" })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "增加窗口高度" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "减小窗口宽度" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "增加窗口宽度" })

-- 4. 窗口交换与移动（可选）
-- 使用 <leader>w + h/j/k/l 将当前窗口移动到对应方向
vim.keymap.set("n", "<leader>wh", "<C-w>H", { desc = "将窗口移动到最左" })
vim.keymap.set("n", "<leader>wj", "<C-w>J", { desc = "将窗口移动到最下" })
vim.keymap.set("n", "<leader>wk", "<C-w>K", { desc = "将窗口移动到最上" })
vim.keymap.set("n", "<leader>wl", "<C-w>L", { desc = "将窗口移动到最右" })

-- 关闭其他所有窗口，只保留当前窗口
vim.keymap.set("n", "<leader>so", ":only<CR>", { desc = "关闭其他所有窗口" })

