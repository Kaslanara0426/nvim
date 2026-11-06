require("toggleterm").setup({
  direction = "float",
  float_opts = {
    border = "curved", -- 让边框更好看
    width = function()
      return math.floor(vim.o.columns * 0.9)
    end,
    height = function()
      -- 减去 cmdheight，避免浮动窗口遮住命令行
      return math.floor((vim.o.lines - vim.o.cmdheight) * 0.9)
    end,
  },
})

local map = vim.keymap.set

-- 通用开关
map({ "n", "t" }, "<leader>tt", "<Cmd>ToggleTerm<CR>", { desc = "Toggle current Float Terminal" })

-- 创建全新的终端
map({ "n", "t" }, "<leader>tc", function()
  local Terminal = require("toggleterm.terminal").Terminal
  local new_term = Terminal:new({ direction = "float", hidden = true })
  new_term:toggle()
  vim.cmd("startinsert") -- 顺手进入插入模式
end, { desc = "Create new Terminal" })

-- 1~9 号终端（按数字精准切换）
for i = 1, 9 do
  map({ "n", "t" }, "<leader>t" .. i, "<Cmd>" .. i .. "ToggleTerm<CR>", { desc = "Toggle Terminal " .. i })
end
