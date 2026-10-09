-- 真彩色
vim.opt.termguicolors = true

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

-- 与终端背景同步
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

---- 让lsp符号列常驻
--vim.opt.signcolumn = "yes"

-- 隐藏命令行
vim.opt.cmdheight = 0
