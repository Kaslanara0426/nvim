vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.cmd.colorscheme("catppuccin")
-- 行号显示
vim.opt.relativenumber = true  
vim.opt.number = true

-- 行号颜色
vim.api.nvim_set_hl(0, "LineNr", {
  fg = "#FFFFFF",
  bold = false
})
vim.api.nvim_set_hl(0, "LineNrAbove", { link = "LineNr" })
vim.api.nvim_set_hl(0, "LineNrBelow", { link = "LineNr" })

vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#FFD600",
  bold = true,
})
-- 一行颜色
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#111111" })

-- 与终端背景同步
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

-- 让lsp符号列常驻
vim.opt.signcolumn = "yes"

-- 开启真彩色
vim.opt.termguicolors = true

-- 隐藏cmdline（解决lualine被顶上去）
vim.opt.cmdheight = 0

-- 普通模式：当前行减一个缩进
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true, desc = "减少缩进" })
